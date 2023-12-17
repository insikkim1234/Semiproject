package naver.storage;

import java.io.InputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class NcpObjectStorageService implements ObjectStorageService {
	
	AmazonS3 s3;

	public static final String STORAGE_EATINGALONE = "semi-project-eatingalone";
	public static final String DIR_PHOTO = "photo";
	public static final String DIR_USER_PROFILE_PHOTO = "userProfilePhoto";
	public static final String STORAGE_URL = "https://kr.object.ncloudstorage.com";
	public
	static final String STORAGE_PHOTO_PATH = STORAGE_URL + "/" + STORAGE_EATINGALONE + "/" + DIR_PHOTO  + "/";
	public static final String STORAGE_PROFILE_PHOTO_PATH = STORAGE_URL + "/" + STORAGE_EATINGALONE + "/" + DIR_USER_PROFILE_PHOTO  + "/";

	public NcpObjectStorageService(NaverConfig naverConfig) {
		s3 = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(
						naverConfig.getEndPoint(), naverConfig.getRegionName()))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(
						naverConfig.getAccessKey(), naverConfig.getSecretKey())))
				.build();

	}

	@Override
	public String uploadFile(String bucketName, String directoryPath, MultipartFile file) {
		if (file.isEmpty()) {
			System.out.println("[*] NcpObjectStorageService uploadFile file is Empty");
			return null;
		}

		try (InputStream fileIn = file.getInputStream()) {
			String filename = UUID.randomUUID().toString();

			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentType(file.getContentType());
			objectMetadata.setContentLength(file.getSize());

			String uploadFullPath = directoryPath +"/"+ filename;
			uploadFullPath = uploadFullPath.replaceAll("//", "/");

			PutObjectRequest objectRequest = new PutObjectRequest(
					bucketName,
					uploadFullPath,
					fileIn,
					objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead);

			s3.putObject(objectRequest);
			System.out.println(s3.getUrl(bucketName, uploadFullPath).toString());

			return filename;
		} catch (Exception e) {
			throw new RuntimeException("파일 업로드 오류", e);
		}
	}

	public boolean uploadFileWithFileName(String bucketName, String directoryPath, MultipartFile file, String fileUuidName) {
		if (file.isEmpty()) {
			System.out.println("[*] NcpObjectStorageService uploadFile file is Empty");
			return false;
		}

		try (InputStream fileIn = file.getInputStream()) {
			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentType(file.getContentType());
			objectMetadata.setContentLength(file.getSize());

			String uploadFullPath = directoryPath +"/"+ fileUuidName;
			uploadFullPath = uploadFullPath.replaceAll("//", "/");

			PutObjectRequest objectRequest = new PutObjectRequest(
					bucketName,
					uploadFullPath,
					fileIn,
					objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead);

			s3.putObject(objectRequest);
			System.out.println(s3.getUrl(bucketName, uploadFullPath).toString());

			return true;
		} catch (Exception e) {
			throw new RuntimeException("파일 업로드 오류", e);
		}
	}


	@Override
	public void deleteFile(String bucketName, String directoryPath, String fileName) {
		// TODO Auto-generated method stub
		String path=directoryPath+"/"+fileName;
		System.out.println("path="+path);
		//해당 버킷에 파일이 존재하면 true 반환
		boolean isfind=s3.doesObjectExist(bucketName, path);
		System.out.println("isfind="+isfind);
		//존재할경우 삭제
		if(isfind) {
			s3.deleteObject(bucketName, path);
			System.out.println(path+":삭제완료!");
		}				
	}
}

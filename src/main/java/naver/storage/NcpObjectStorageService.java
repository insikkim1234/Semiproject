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
	
	public NcpObjectStorageService(NaverConfig naverConfig) {
		System.out.println("NcpObjectStorageService ����");
		s3 = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(
						naverConfig.getEndPoint(), naverConfig.getRegionName()))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(
						naverConfig.getAccessKey(), naverConfig.getSecretKey())))
				.build();
	}

	@Override
	public String uploadFile(String bucketName, String directoryPath, MultipartFile file) {
		System.out.println("uploadFile="+file.getOriginalFilename());

		if (file.isEmpty()) {
			return null;
		}

		try (InputStream fileIn = file.getInputStream()) {
			String filename = UUID.randomUUID().toString();

			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentType(file.getContentType());

			PutObjectRequest objectRequest = new PutObjectRequest(
					bucketName,
					directoryPath +"/"+ filename,
					fileIn,
					objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead);

			s3.putObject(objectRequest);
			
			//return s3.getUrl(bucketName, directoryPath + filename).toString();
			return filename;

		} catch (Exception e) {
			throw new RuntimeException("���� ���ε� ����", e);
		}
	}

	@Override
	public void deleteFile(String bucketName, String directoryPath, String fileName) {
		// TODO Auto-generated method stub
		String path=directoryPath+"/"+fileName;
		System.out.println("path="+path);
		//�ش� ��Ŷ�� ������ �����ϸ� true ��ȯ
		boolean isfind=s3.doesObjectExist(bucketName, path);
		System.out.println("isfind="+isfind);
		//�����Ұ�� ����
		if(isfind) {
			s3.deleteObject(bucketName, path);
			System.out.println(path+":�����Ϸ�!");
		}				
	}
}


package semi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageDto {
    int curPage;
    int startPage;
    int endPage;
    int totalPage;
    int totalCnt;

    @Override
    public String toString() {
        return "PageDto{" +
                "curPage=" + curPage +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", totalPage=" + totalPage +
                ", totalCnt=" + totalCnt +
                '}';
    }
}

package utils;

import semi.config.BoardConfig;
import semi.dto.PageDto;

public class BoardUtils {
    public static PageDto getPage(int curPage, int totalCnt) {
        int totalPage = (int)(Math.ceil((double)totalCnt/ BoardConfig.PAGE_SIZE));
        if (totalPage <= 0) totalPage = 1;

        int startPage = curPage - BoardConfig.BLOCK_SIZE;
        if (startPage <= 0) startPage = 1;

        int endPage = curPage + BoardConfig.BLOCK_SIZE;
        if (endPage > totalPage) endPage = totalPage;

        return new PageDto(curPage, startPage, endPage, totalPage, totalCnt);
    }


}

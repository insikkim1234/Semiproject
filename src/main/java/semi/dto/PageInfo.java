package semi.dto;

public class PageInfo {

	   private int currentPage;   // 현재 페이지
	   private int boardLimit;      // 페이지 당 게시글 갯수
	   private int totalCount;      // 전체 게시글 갯수
	   private int navLimit;      // 페이지 당 내비게이터 갯수 (navCountPerPage)
	   private int startNav;      // 내비게이터 시작 페이지
	   private int endNav;         // 내비게이터 끝 페이지
	   private int maxPage;      // 페이지의 마지막 번호 (navTotalCount)
	   
	   public PageInfo() {}

	   public PageInfo(int currentPage, int boardLimit, int totalCount, int navLimit, int startNav, int endNav, int maxPage) {
		  this.currentPage = currentPage;
		  this.boardLimit = boardLimit;
	      this.totalCount = totalCount;
		  this.navLimit = navLimit;
		  this.startNav = startNav;
		  this.endNav = endNav;
		  this.maxPage = maxPage;
	   }

	   public int getCurrentPage() {
	      return currentPage;
	   }

	   public void setCurrentPage(int currentPage) {
	      this.currentPage = currentPage;
	   }

	   public int getBoardLimit() {
	      return boardLimit;
	   }

	   public void setBoardLimit(int boardLimit) {
	      this.boardLimit = boardLimit;
	   }

	   public int getTotalCount() {
	      return totalCount;
	   }

	   public void setTotalCount(int totalCount) {
	      this.totalCount = totalCount;
	   }

	   public int getNavLimit() {
	      return navLimit;
	   }

	   public void setNavLimit(int navLimit) {
	      this.navLimit = navLimit;
	   }

	   public int getStartNav() {
	      return startNav;
	   }

	   public void setStartNav(int startNav) {
	      this.startNav = startNav;
	   }

	   public int getEndNav() {
	      return endNav;
	   }

	   public void setEndNav(int endNav) {
	      this.endNav = endNav;
	   }

	   public int getMaxPage() {
	      return maxPage;
	   }

	   public void setMaxPage(int maxPage) {
	      this.maxPage = maxPage;
	   }

	   @Override
	   public String toString() {
	      return "PageInfo [currentPage=" + currentPage + ", boardLimit=" + boardLimit + ", totalCount=" + totalCount + ", navLimit=" + navLimit + ", startNav=" + startNav + ", endNav=" + endNav + ", maxPage=" + maxPage + "]";
	   }
	   
	}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
  body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
  }

  .loading-container {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
  }

  .loading-spinner {
    border: 8px solid #3498db;
    border-top: 8px solid #f4f4f4;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    animation: spin 1s linear infinite;
  }

  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }

  .hidden {
    display: none;
  }
</style>

<script>
  document.addEventListener("DOMContentLoaded", function() {
    // 메인 페이지 URL
    var mainPageUrl = "${pageContext.request.contextPath}/semi";

    // 메인 페이지로 이동
    window.location.href = mainPageUrl;
  });
</script>

<!-- loading.jsp -->
<div id="loading" class="loading-container">
  <div class="loading-spinner"></div>
</div>

<h1>Cooking in progress..</h1>
<div id="cooking">
  <div class="bubble"></div>
  <div class="bubble"></div>
  <div class="bubble"></div>
  <div class="bubble"></div>
  <div class="bubble"></div>
  <div id="area">
    <div id="sides">
      <div id="pan"></div>
      <div id="handle"></div>
    </div>
    <div id="pancake">
      <div id="pastry"></div>
    </div>
  </div>
</div>
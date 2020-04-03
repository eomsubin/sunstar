<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
body {
	font-size: 0.77em;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">정보 확인</h1>
		<p class="mb-4">
			내 정보를 확인하고 수정 할 수 있습니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables
					Example</h6>
			</div>
			<div class="card-body">
				<c:if test="${dd > 10}">
					<div style="padding:12px; margin:12px;">

						<p>현재는 정산신청 기간이 아닙니다.</p>
						<p>
							<strong>매월 1일부터 10일 사이</strong>에 신청해주세요
						</p>
					</div>

				</c:if>


				<c:if test="${01 < dd && dd < 11}">
					<div style=" margin:12px;  padding: 12px; border-radius:6px; background-color: rgba(78,115,223, 0.1); width:600px;" >

						<p>정산신청 기간은 매월 1일부터 10일입니다.</p>
						<p style="color: red; font-size: 1.3em; font-weight: 700;">현재
							정산신청 기간입니다.</p>
						<p>아래 항목을 모두 기입 하신 후 신청 해주세요!</p>
					</div>

					<!-- 내용 -->

					<form action="${pageContext.request.contextPath}/seller/insertAccount" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
						
					<input type="hidden" name="yyyymm" id="yyyymm" value="${yyyy}${mm}">
						<div>
							<div class=" form-group justify-content-center">
								<div class="form-group col-md-6">
									<label for="seller_code">판매자 코드 </label> <input type="text"
										class="form-control" name="seller_code" value="${seller_code}"
										id="seller_code" readonly="readonly">
								</div>
								<div class=" col-md-6 ">
									<label for="total_profit"> ${yyyy}년 ${mm}월 총 수익</label>
									<input type="text" class="form-control" name="total_profit"
										value="${total_profit}" id="total_profit" readonly="readonly">
									
								</div>
								<div class=" col-md-6">
									<label for="commission">수수료율 10%</label> <input
										type="text" class="form-control" id="commission"
										name="commission" value="${commission}" required  readonly="readonly">
								</div>


								<div class=" col-md-6">
									<label for="balance_accounts">정산금액</label> <input
										type="text" class="form-control" id="balance_accounts"
										name="balance_accounts" value="${balance_accounts}" required  readonly="readonly">
								</div>

								<div class=" col-md-6">
									<label for="bank">입금 계좌</label> <input
										type="text" class="form-control" id="bank"
										name="bank" value="${dto.bank}" required  readonly="readonly">
								</div>

								<div class=" col-md-6">
									<label for="bank_no">계좌번호</label> <input
										type="text" class="form-control" id="bank_no"
										name="bank_no" value="${dto.bank_no}" required  readonly="readonly">
								</div>
								
								
								<div style="margin:12px; padding:12px; width:900px;">
								
<h2>정산 관련 이용약관</h2>
<h3>제31조    (서비스이용료)</h3>
<ul>
<li>① 서비스이용료는 회사 내부 정책에 따라 작가회원의 판매방식과 작품 카테고리등의 판매조건에 따라 분류되어 정해질 수 있습니다.</li>
<li>② 서비스이용료는 회사의 정책에 따라 변경될 수 있으며, 회사와 작가회원의 별도 약정 및 운영 정책에 따라 작가회원에게 적용되는 서비스이용료가 다를 수 있습니다.</li>
<li>③ 서비스이용료는 기본이용료(표준마진율)와 작가회원 공제금 수수료를 각각 산정하여 합산합니다. 작가회원 공제금을 작가회원이 회사로부터 환급 받는 경우 작가회원 공제금 수수료는 0원으로 합니다.</li>
<li>④ 회사는 필요한 경우 서비스이용료를 신설, 변경할 수 있으며, 신설 또는 변경사항은 회사가 제공하는 서비스화면을 통하여 통지합니다.</li>
<li>⑤ 회사는 판매 활성화 등을 위하여 기본이용료 범위 내에서 특정 물품에 대한 기본이용료를 할인할 수 있습니다. 특정물품의 판매가격이 할인된 경우(단, 작가회원이 회사와 사전 협의 없이 판매가격을 할인한 경우를 제외함) 해당 물품에 대한 서비스이용료는 할인 전 물품 가액을 기준으로 한 기본이용료 금액에서 그 할인액을 차감하여 산정합니다</li>
<li>⑥ 서비스이용료는 판매대금에서의 공제, 포인트 사용 등으로 결제할 수 있으며, 회사와 작가회원간의 사전 협의 또는 회사의 내부 사정에 따라 요율, 결제방법 등이 변경될 수 있습니다.</li>
<li>⑦ 회사는 당월에 발생한 서비스이용료에 대한 세금계산서를 익월 15일까지 매월 작가회원에게 발행합니다</li>
</ul>
<h3>제32조    (판매대금의 정산)</h3>
<ul>
<li>① 작품판매대금에 대한 정산은 작품 판매 가격에서 서비스이용료를 제외한 금액을 기준으로 산정되며, 작가회원은 서비스이용료 및 배송비 등을 고려하여 작품의 판매 대금을 자유롭게 정할 수 있습니다.</li>
<li>② 작가회원이 회사를 통하여 판매한 작품의 판매대금은 당해 작품의 배송완료 후 반품기간(7일) 후를 기준으로 하여 8주 이내로 정산함을 원칙으로 하되, 회사는 작가회원의 거래실적과 신용등급에 따라 이를 조정할 수 있습니다. 정산일이 비영업일일 경우 익일 영업일 정산을 원칙으로 합니다. 이와 관련한 세부 사항은 다음과 같습니다.</li>
<li>③ 정산 확정금액: 주문이 생성되고 유효기간 내에 배송된 내역에 대한 판매금액이 정산확정금액으로 책정됩니다.</li>
<li>④ 배송작품: 주문한 작품이 배송완료되어 고객이 구매완료를 하거나, 배송완료 후 7일이 지나도록 교환/반품 등에 대한 요청이 없을 경우 판매금액이 정산금액으로 책정됩니다.</li>
<li>⑤ 정산확정을 위해서는 배송준비중, 배송중, 배송완료 상태로의 변경을 적시에 해 주어야 하며, 상태 변경이 누락된 주문 건에 대해서는 정산이 이루어지지 않을 수 있으니 작가회원은 주문관리를 누락하지 않도록 주의하여야 합니다.</li>
<li>⑥ 회사의 작가회원에 대한 정산 일자 등 구매안전 서비스의 운영에 관한 구체적인 내용은 회사가 제공하는 서비스화면을 통하여 공지합니다.</li>
</ul>
<h3><strong>제33조  (정산의 보류)</strong></h3>
<ul>
<li><strong>① 회사는 작가회원의 귀책사유로 인해 발생한 비용을 판매대금 정산 시 정산금액에서 공제한 후 나머지 금액에 한하여 작가회원에게 지급할 수 있습니다.</strong></li>
<li><strong>② 작가회원 또는 회사가 서비스 이용 계약을 해지한 경우, 회사는 작가회원의 마지막 3개월 동안 월평균 판매액의 30%에 해당하는 금액을 계약 해지일로부터 3개월 동안 예치하여 고객으로부터의 클레임에 대한 환불, 교환 등 추가비용지급에 사용하고, 이러한 염려가 없어진 후 나머지 금액 전액을 지급할 수 있습니다.</strong></li>
<li><strong>③ 작가회원의 채권자의 신청에 의한 판매대금의 가압류, 압류 및 추심명령 등 법원의 결정이 있을 경우, 회사는 작가회원과 채권자 간의 합의 또는 채무액의 변제 등으로 동 결정이 해제될 때까지 판매대금의 정산을 중지하거나 제3채무자로서 작가회원의 정당한 채무를 변제할 수 있습니다.</strong></li>
<li><strong>④ 회사는 장기간 배송지연 건을 배송완료 건으로 간주하여 주문 절차를 종결할 수 있되, 판매대금의 정산은 향후 고객의 환불 요청에 대비하여 일정기간 유보할 수 있습니다.</strong></li>
<li><strong>⑤ 회원이 신용카드로 결제한 경우, 『여신전문금융거래법』상의 규정에 따라 회사는 신용카드 부정사용을 통한 허위거래여부를 판단하기 위해 일정기간 정산을 보류할 수 있습니다. 이 경우, 회사는 거래사실 확인을 위한 증빙을 작가회원에 요구할 수 있으며, 회사는 사실 여부 확인 후 작품판매대금을 지급할 수 있습니다.</strong></li>
<li><strong>⑥ 회사는 작가회원이 매매 부적합 작품의 판매자로 적발되거나, 판매량이 상당하여 다수 고객의 피해보상이 발생할 우려가 이 되는 경우, 연락두절로 추가적인 구매자 클레임에 협조를 구할 수 없다고 판단되는 경우에는 일정기간 정산을 보류할 수 있습니다.</strong></li>
<li><strong>⑦ 작가회원은 폐업신고 이후에는 원칙적으로 판매가 금지되며, 회사는 작가회원의 폐업 이후에 판매된 작품의 판매대금에 관해서는 정산을 하지 않는 것을 원칙으로 합니다.</strong></li>
<li><strong>⑧ 본 조에 정한 외에도 법률의 규정에 의하거나 합리적인 사유가 있는 경우에는 회사는 작가회원에게 통지하고 판매대금의 전부 또는 일부에 대한 정산을 일정 기간 유보할 수 있습니다.</strong></li>
</ul>
								
								</div>

							
							</div>
							<div  style="margin:12px;">
							<input type="checkbox" required="required"> <label> 이용약관에 동의 하시면 체크 해주세요 </label>
							
							</div>
							<div style="margin:12px;">
								<button type="submit" class="btn btn-primary" style="">정산 신청</button>
							</div>
						</div>
					</form>
					<!-- 내용 끝 -->
				</c:if>



			</div>
		</div>
	</div>

</body>
</html>
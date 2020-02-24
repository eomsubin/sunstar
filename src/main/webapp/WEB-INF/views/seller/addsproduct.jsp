<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">Home</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="#">Forms</a>
				</li>
			</ul>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon white edit"></i><span class="break"></span>Form Elements</h2>
						<div class="box-icon">
							<a href="#" class="btn-setting"><i class="halflings-icon white wrench"></i></a>
							<a href="#" class="btn-minimize"><i class="halflings-icon white chevron-up"></i></a>
							<a href="#" class="btn-close"><i class="halflings-icon white remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal">
						  <fieldset>
							<div class="control-group">
							  <label class="control-label" for="typeahead">상품명 </label>
							  <div class="controls">
								<input type="text" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
								<p class="help-block">Start typing to activate auto complete!</p>
							  </div>
							</div>
							
							  <div class="control-group">
								<label class="control-label" for="appendedInput">가격</label>
								<div class="controls">
								  <div class="input-append">
									<input id="appendedInput" size="16" type="text"><span class="add-on">원</span>
								  </div>
								  <span class="help-inline">Here's more help text</span>
								</div>
							  </div>
							  <div class="control-group">
								<label class="control-label" for="appendedInput">배송비</label>
								<div class="controls">
								  <div class="input-append">
									<input id="appendedInput" size="16" type="text"><span class="add-on">원</span>
								  </div>
								  <span class="help-inline">Here's more help text</span>
								</div>
							  </div>
							
							<div class="control-group">
								<label class="control-label" for="selectError2">카테고리</label>
								<div class="controls">
									<select data-placeholder="Your Favorite Football Team" id="selectError2" data-rel="chosen">
										<option value=""></option>
										<optgroup label="NFC EAST">
										  <option>Dallas Cowboys</option>
										  <option>New York Giants</option>
										  <option>Philadelphia Eagles</option>
										  <option>Washington Redskins</option>
										</optgroup>
										<optgroup label="NFC NORTH">
										  <option>Chicago Bears</option>
										  <option>Detroit Lions</option>
										  <option>Green Bay Packers</option>
										  <option>Minnesota Vikings</option>
										</optgroup>
										<optgroup label="NFC SOUTH">
										  <option>Atlanta Falcons</option>
										  <option>Carolina Panthers</option>
										  <option>New Orleans Saints</option>
										  <option>Tampa Bay Buccaneers</option>
										</optgroup>
										<optgroup label="NFC WEST">
										  <option>Arizona Cardinals</option>
										  <option>St. Louis Rams</option>
										  <option>San Francisco 49ers</option>
										  <option>Seattle Seahawks</option>
										</optgroup>
										<optgroup label="AFC EAST">
										  <option>Buffalo Dennis Jis</option>
										  <option>Miami Dolphins</option>
										  <option>New England Patriots</option>
										  <option>New York Jets</option>
										</optgroup>
										<optgroup label="AFC NORTH">
										  <option>Baltimore Ravens</option>
										  <option>Cincinnati Bengals</option>
										  <option>Cleveland Browns</option>
										  <option>Pittsburgh Steelers</option>
										</optgroup>
										<optgroup label="AFC SOUTH">
										  <option>Houston Texans</option>
										  <option>Indianapolis Colts</option>
										  <option>Jacksonville Jaguars</option>
										  <option>Tennessee Titans</option>
										</optgroup>
										<optgroup label="AFC WEST">
										  <option>Denver Broncos</option>
										  <option>Kansas City Chiefs</option>
										  <option>Oakland Raiders</option>
										  <option>San Diego Chargers</option>
										</optgroup>
								  </select>
								</div>
							  </div>

							<div class="control-group">
							  <label class="control-label" for="fileInput">이미지 첨부</label>
							  <div class="controls">
								<input class="input-file uniform_on" id="fileInput" type="file">
							  </div>
							</div>          
							<div class="control-group hidden-phone">
							  <label class="control-label" for="textarea2">상품 상세정보</label>
							  <div class="controls">
								<textarea class="cleditor" id="textarea2" rows="3"></textarea>
							  </div>
							</div>

                        
                        <div class="control-group">
								<label class="control-label">공개여부 체크</label>
								<div class="controls">
								  <label class="radio">
									<input type="checkbox" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
									상품을 공개 할 경우 체크
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="checkbox" name="optionsRadios" id="optionsRadios2" value="option2">
									상품에 대한 리뷰를 공개 할 경우 체크
								  </label>
								</div>
							  </div>
							  
							  
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">Save changes</button>
							  <button type="reset" class="btn">Cancel</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="clearfix"></div>
</body>
</html>
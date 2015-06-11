<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Combination Centric</title>
<script type='text/javascript' src='/ArchDesigner/dwr/engine.js'></script>
<script type='text/javascript' src='/ArchDesigner/dwr/util.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/DecisionServer.js'></script>
<script type='text/javascript'
	src='/ArchDesigner/dwr/interface/ApplicationServer.js'></script>

</head>

<body>

	<div id="container">
            <%@include  file="dashboard.html" %>


	<div id="page-wrapper">
		<br>
		<table id="decisiontable" style="border: none;">
			<tbody>
				<tr>
					<td style="border: none; font-weight: bold;">
						<h2>Combination Centric Analysis</h2></td>
					<td style="border: none;"></td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;"><label>Application Name</label></td>
					<td style="border: none;"><select class="form-control" id="appselect"
						style="width: 250px;">
							<script type="text/javascript">
								var arr = function(a) {
									var b = a;
									for (i = 0; i < b.length; i++) {
										var x = document
												.createElement("OPTION");
										var t = document
												.createTextNode(b[i][0]);
										//alert(b[i][0]);
										x.appendChild(t);
										document.getElementById("appselect")
												.appendChild(x);
									}
								}
								ApplicationServer.GetApplicationValue(arr);
							</script>
							<!-- 	<option value="A">AAAAAA</option>
								<option value="B">BBBBBB</option>
								<option value="C">CCCCCC</option>
								<option value="D">DDDDDD</option> -->
					</select></td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
							<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
				<tr>
					<td style="border: none;"><label>Order</label></td>
					<td style="border: none;"><select class="form-control" id="orderselect"
						style="width: 250px;">
							<option value="A">Best</option>
							<option value="B">Medium</option>
							<option value="C">Worst</option>
					</select></td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
							<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
				<tr>
					<td style="border: none;"><label>Combination</label></td>
					<td style="border: none;"><select class="form-control" id="Comselect"
						style="width: 150px;">
							<option value="A">AAAAAA</option>
							<option value="B">BBBBBB</option>
							<option value="C">CCCCCC</option>
							<option value="D">DDDDDD</option>
					</select>&nbsp; <label>No</label><input type="text" id="Notxt" name="NoName"
						value='' style="width: 50px;" /></td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
							<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
				<tr>
					<td style="border: none;"><label>Stakeholder Name</label></td>
					<td style="border: none;"><select class="form-control" id="Stkhldrselect"
						style="width: 250px;">
							<option value="A">AAAAAA</option>
							<option value="B">BBBBBB</option>
							<option value="C">CCCCCC</option>
							<option value="D">DDDDDD</option>
					</select></td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
							<tr>
				<td style="border: none;">&nbsp;</td>
				<td style="border: none;">&nbsp;</td>
			</tr>
				<tr>
					<td style="border: none;"><label>Quality Name</label></td>
					<td style="border: none;"><select class="form-control" id="Stkhldrselect"
						style="width: 250px;">
							<option value="A">AAAAAA</option>
							<option value="B">BBBBBB</option>
							<option value="C">CCCCCC</option>
							<option value="D">DDDDDD</option>
					</select></td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;"><label>Including</label></td>
					<td style="border: none;"><input class="form-control" type="checkbox" name="check" value="checkbox"></td>
					<td style="border: none;"><label>Operator</label></td>
					<td style="border: none;"><select class="form-control" id="operatorselect"
						style="width: 150px;">
							<option value="A">AA</option>
							<option value="B">BB</option>
							<option value="C">CC</option>
							<option value="D">DD</option>
					</select></td>
				</tr>
				<tr>
					<td style="border: none;"><label>&nbsp;</label></td>
					<td style="border: none;"><textarea class="form-control" id="Includetext1" rows="4"
							cols="50" style="width: 250px; height: 100px;"> 
					</textarea></td>
					<td style="border: none;"><input value=">>"type="button"
						onclick="forward();" style="margin-left: 15px;margin-right: 15px;" /><input
						value="<<" type="button" onclick="backword();"
						style="margin-left: 15px;margin-right: 15px;" /></td>
					<td style="border: none;"><textarea id="Includetext2" rows="4"
							cols="50" style="width: 250px; height: 100px;"> 
					</textarea></td>
				</tr>
				<tr>
					<td style="border: none;"><label>Excluding</label></td>
					<td style="border: none;"><input class="form-control" type="checkbox" name="check" value="checkbox"></td>
					<td style="border: none;"><label>Operator</label></td>
					<td style="border: none;"><select class="form-control" id="operatorselect"
						style="width: 150px;">
							<option value="A">AA</option>
							<option value="B">BB</option>
							<option value="C">CC</option>
							<option value="D">DD</option>
					</select></td>
				</tr>
				<tr>
					<td style="border: none;"><label>&nbsp;</label></td>
					<td style="border: none;"><textarea class="form-control" id="Excludetext1" rows="4"
							cols="50" style="width: 250px; height: 100px;"> 
					</textarea></td>
					<td style="border: none;"><input value=">>" type="button"
						onclick="forward();" style="margin-left: 15px;margin-right: 15px;" /><input
						value="<<" type="button" onclick="backword();"
						style="margin-left: 15px;margin-right: 15px;" /></td>
					<td style="border: none;"><textarea id="Excludetext2" rows="4"
							cols="50" style="width: 250px; height: 100px;"> 
					</textarea></td>
				</tr>
				<tr>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border: none;"></td>
					<td style="border: none;"></td>
					<td style="border: none;">&nbsp;</td>
					<td style="border: none;"><input class="btn btn-info" value="Execute AQL"
						type="button" onclick="execute();" /></td>
				</tr>
			</tbody>
		</table>
		<br>
		<script type="text/javascript">
			var button = function() {
				var arr = [];
				arr.push(document.getElementById('AppNametxt').value);
				arr.push(document.getElementById('Remarktext').value);
				ApplicationServer.SetApplicationValue(arr, ar);
			}
			var ar = function() {
				alert("Success");
			}
		</script>
	</div>
	<br>
	<br>
	<br>
	</div>
</body>
</html>
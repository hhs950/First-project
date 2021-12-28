(function () {
						    calendarMaker($("#calendarForm"), new Date());
						})();

						var nowDate = new Date();
						function calendarMaker(target, date) {
						    if (date == null || date == undefined) {
						        date = new Date();
						    }
						    nowDate = date;
						    if ($(target).length > 0) {
						        var year = nowDate.getFullYear();
						        var month = nowDate.getMonth() + 1;
						        $(target).empty().append(assembly(year, month));
						    } else {
						        console.error("custom_calendar Target is empty!!!");
						        return;
						    }

						    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
						    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


						    var tag = "<tr>";
						    var cnt = 0;
						    //�� ���� ������ֱ�
						    for (i = 0; i < thisMonth.getDay(); i++) {
						        tag += "<td></td>";
						        cnt++;
						    }

						    //��¥ ä���
						    for (i = 1; i <= thisLastDay.getDate(); i++) {
						        if (cnt % 7 == 0) { tag += "<tr>"; }

						        tag += "<td>" + i + "</td>";
						        cnt++;
						        if (cnt % 7 == 0) {
						            tag += "</tr>";
						        }
						    }
						    $(target).find("#custom_set_date").append(tag);
						    calMoveEvtFn();

						    function assembly(year, month) {
						        var calendar_html_code =
						            "<table class='custom_calendar_table'>" +
						            "<colgroup>" +
						            "<col style='width:81px'/>" +
						            "<col style='width:81px'/>" +
						            "<col style='width:81px'/>" +
						            "<col style='width:81px'/>" +
						            "<col style='width:81px'/>" +
						            "<col style='width:81px'/>" +
						            "<col style='width:81px'/>" +
						            "</colgroup>" +
						            "<thead class='cal_date'>" +
						            "<th><button type='button' class='prev'><</button></th>" +
						            "<th colspan='5'><p align='center'><span>" + year + "</span>�� <span>" + month + "</span>��</p></th>" +
						            "<th><button type='button' class='next'>></button></th>" +
						            "</thead>" +
						            "<thead  class='cal_week' align='center'>" +
						            "<th>��</th><th>��</th><th>ȭ</th><th>��</th><th>��</th><th>��</th><th>��</th>" +
						            "</thead>" +
						            "<tbody id='custom_set_date'>" +
						            "</tbody>" +
						            "</table>";
						        return calendar_html_code;
						    }

						    function calMoveEvtFn() {
						        //���� Ŭ��
						        $(".custom_calendar_table").on("click", ".prev", function () {
						            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
						            calendarMaker($(target), nowDate);
						        });
						        //������ Ŭ��
						        $(".custom_calendar_table").on("click", ".next", function () {
						            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
						            calendarMaker($(target), nowDate);
						        });
						        //���� ���� Ŭ��
						        $(".custom_calendar_table").on("click", "td", function () {
						            $(".custom_calendar_table .select_day").removeClass("select_day");
						            $(this).removeClass("select_day").addClass("select_day");
						        });
						    }
						}
			
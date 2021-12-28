let loc = {
           latPos: 0,
           longPos: 0
        };
  
   $(function(){
          areaSelectMaker("#addressRegion1", "#addressDo1", "#addressSiGunGu1");            
      });

      var areaSelectMaker = function(a1, a2, a3){
          if(a1 == null || a2 == null || a3 == null){
              console.warn("Unkwon Area Tag");
              return;
          }
          var area = {
"광주광역시" :{
       "북구" : ['중흥동','유동','누문동','북동','임동','신안동','용봉동',
      '동림동','운암동','우산동','풍향동','문흥동','각화동',
      '두암동','오치동','삼각동','매곡동','충효동','덕의동',
      '금곡동','망월동','청풍동','화암동','장등동','운정동',
      '본촌동','일곡동','양산동','연제동','신용동','용두동',
      '지야동','태령동','수곡동','효령동','용전동','용강동',
      '생용동','월출동','오룡동','중앙동','문화동'      
      ],
                  "동구" :['대인동','금남로5가','충장로5가','수기동',
      '대의동','궁동','장동','동명동','계림동',
      '산수동','지산동','남동','광산동','금동','호남동',
      '불로동','황금동','서석동','소태동',
      '용연동','운림동','학동','월남동','선교동','내남동',
      '용산동','충장로1가','충장로2가','충장로3가','충장로4가',
      '금남로1가','금남로2가','금남로3가','금남로4가',
      '충장동','계림1동','계림2동','산수1동','산수2동',
      '지산1동','지산2동','서남동','학운동','지원1동','지원2동'],
                  "서구" : ['양동','농성동','광천동','유촌동','덕흥동',
      '쌍촌동','화정동','치평동','내방동','서창동','세하동',
      '용두동','풍암동','벽진동','금호동','마륵동','매월동',
      '동천동','양3동','농성1동','농성2동','유덕동',
      '상무1동','상무2동','화정1동','화정2동','화정3동','화정4동',
      '금호1동','금호2동'],         
              
      "남구" : ['사동','구동','서동','월산동','백운동','주월동','노대동',
      '진월동','덕남동','행암동','임암동','송하동','양림동','방림동',
      '봉선동','구소동','양촌동','도금동','승촌동','지석동','압촌동',
      '화장동','칠석동','석정동','신장동','양과동','이장동','대지동',
      '원산동','월성동','방림1동','방림2동','봉선1동','봉선2동',
      '사직동','월산4동','월산5동','백운1동','백운2동',
      '주월1동','주월2동','효덕동','송암동','대촌동'],         
              
      "광산구" : ['송정동','도산동','도호동','신촌동','서봉동','운수동',
      '선암동','소촌동','우산동','황룡동','박호동','비아동',
      '도천동','수완동','월계동','쌍암동','산월동','신창동',
      '신가동','운남동','안청동','진곡동','장덕동','흑석동',
      '하남동','장수동','산정동','월곡동','등임동','산막동',
      '고룡동','신룡동','두정동','임곡동','광산동','오산동',
      '사호동','하산동','유계동','본덕동','용봉동','요기동',
      '복룡동','송대동','옥동','월전동','장록동','송촌동',
      '지죽동','용동','용곡동','지정동','명화동','동산동',
      '연산동','도덕동','송산동','지평동','오운동','삼거동',
      '양동','내산동','대산동','송학동','신동','삼도동','남산동',
      '송치동','산수동','선동','지산동','왕동','북산동','명도동',
      '동호동','덕림동','양산동','동림동','오선동',
      '송정1동','송정2동','신흥동','어룡동',
      '월곡1동','월곡2동','첨단1동','첨단2동',
      '동곡동','평동','본량동']         
              }             
          };   
      //초기화
          init(true, true);
          //권역 기본 생성
          var areaKeys1 = Object.keys(area);
          areaKeys1.forEach(function(Region){
              $(a1).append("<option value="+Region+">"+Region+"</option>");
          });
          //변경 이벤트
          $(document).on("change", a1, function(){             
              init(false, true);
              var Region = $(this).val();
              var keys = Object.keys(area[Region]);
              keys.forEach(function(Do){
                  $(a2).append("<option value="+Do+">"+Do+"</option>");    
              });
          }).on("change", a2, function(){
              init();
              var Region = $(a1).val();
              var Do = $(this).val();
              var keys = Object.keys(area[Region][Do]);
              keys.forEach(function(SiGunGu){
                  $(a3).append("<option value="+area[Region][Do][SiGunGu]+">"+area[Region][Do][SiGunGu]+"</option>");    
              });
          });

          function init(first, second){
              first ? $(a1).empty().append("<option value=''>선택</option>") : "";
              second ? $(a2).empty().append("<option value=''>선택</option>") : "";
              $(a3).empty().append("<option value=''>선택</option>");
          }
          
        //javascript 문법 
        //실시간 위치는 별도 api 설치해야함  latPos:위도, longPos:경도
       
        
               
      $(a3).on('change', function(){
           if($(a3).val() == "중흥동"){
              loc['latPos'] = 35.16685965705115;
              loc.longPos = 126.91252112836659;
              
        }else if ($(a3).val() == '유동') {
              loc['latPos'] = 35.15881601000478;
              loc.longPos = 126.90449290560778;
              
        }else if ($(a3).val() == '누문동') {
              loc['latPos'] = 35.15372773643367;
              loc.longPos = 126.9064612819866;
              
        }else if ($(a3).val() == '북동') {
              loc['latPos'] = 35.155690803432165;
              loc.longPos = 126.91181810268657;
              
        }else if ($(a3).val() == '신안동') {
              loc['latPos'] = 35.17026097586429;
              loc.longPos = 126.89622129612867;
              
        }else if ($(a3).val() == '용봉동') {
              loc['latPos'] = 35.18152357958344;
              loc.longPos = 126.89644951233316;
              
        }else if ($(a3).val() == '동림동') {
              loc['latPos'] = 35.177361975813916;
              loc.longPos = 126.86490609597449;
              
        }else if ($(a3).val() == '운암동') {
              loc['latPos'] = 35.18120229266563;
              loc.longPos = 126.87663692438908;
              
        }else if ($(a3).val() == '우산동') {
              loc['latPos'] = 35.15401992837968;
              loc.longPos = 126.81185861305966;
              
        }else if ($(a3).val() == '풍향동') {
              loc['latPos'] = 35.16786323645808;
              loc.longPos = 126.92463425158908;
              
        }else if ($(a3).val() == '문흥동') {
              loc['latPos'] = 35.18927576157403;
              loc.longPos = 126.92378883251676;
              
        }else if ($(a3).val() == '각화동') {
              loc['latPos'] = 35.18122731761578;
              loc.longPos = 126.93791293522136;
              
        }else if ($(a3).val() == '두암동') {
              loc['latPos'] = 35.166308991934685;
              loc.longPos = 126.93483039945113;
              
        }else if ($(a3).val() == '오치동') {
              loc['latPos'] = 35.18918883421051;
              loc.longPos = 126.9129381904357;
              
        }else if ($(a3).val() == '삼각동') {
              loc['latPos'] = 35.20032224232315;
              loc.longPos = 126.90045954170739;
              
        }else if ($(a3).val() == '매곡동') {
              loc['latPos'] = 35.190917842959514;
              loc.longPos = 126.89148592440107;
              
        }else if ($(a3).val() == '충효동') {
              loc['latPos'] = 35.181065197693805;
              loc.longPos = 127.00275421263159;
              
        }else if ($(a3).val() == '덕의동') {
              loc['latPos'] = 35.178856416004194;
              loc.longPos = 126.98322695787608;
              
        }else if ($(a3).val() == '금곡동') {
              loc['latPos'] = 35.15013547828247;
              loc.longPos = 126.99578081316054;
              
        }else if ($(a3).val() == '망월동') {
              loc['latPos'] = 35.20581197416344;
              loc.longPos = 126.95079587206651;
              
        }else if ($(a3).val() == '청풍동') {
              loc['latPos'] = 35.17328947308734;
              loc.longPos = 126.96411083660608;
              
        }else if ($(a3).val() == '화암동') {
              loc['latPos'] = 35.151973054420274;
              loc.longPos = 126.96960394755551;
              
        }else if ($(a3).val() == '장등동') {
              loc['latPos'] = 35.21451966899525;
              loc.longPos = 126.9224267455446;
              
        }else if ($(a3).val() == '운정동') {
              loc['latPos'] = 35.23518935847745;
              loc.longPos = 126.93998690535213;
              
        }else if ($(a3).val() == '본촌동') {
              loc['latPos'] = 35.21979214895595;
              loc.longPos = 126.87993845181576;
              
        }else if ($(a3).val() == '일곡동') {
              loc['latPos'] = 35.209788512723584;
              loc.longPos = 126.89840770912892;
              
        }else if ($(a3).val() == '양산동') {
              loc['latPos'] = 35.20847527600841;
              loc.longPos = 126.88110743917366;
              
        }else if ($(a3).val() == '연제동') {
              loc['latPos'] = 35.20075539328987;
              loc.longPos = 126.86996030603636;
              
        }else if ($(a3).val() == '신용동') {
              loc['latPos'] = 35.2125354885646;
              loc.longPos = 126.86544899327824;
              
        }else if ($(a3).val() == '용두동') {
              loc['latPos'] = 35.215587882829794;
              loc.longPos = 126.87469723429602;
              
        }else if ($(a3).val() == '지야동') {
              loc['latPos'] = 35.23132659480772;
              loc.longPos = 126.88556252790364;
              
        }else if ($(a3).val() == '태령동') {
              loc['latPos'] = 35.24953073057804;
              loc.longPos = 126.92484050059404;
              
        }else if ($(a3).val() == '수곡동') {
              loc['latPos'] = 35.2439687128917;
              loc.longPos = 126.9224887041654;
              
        }else if ($(a3).val() == '효령동') {
              loc['latPos'] = 35.23583432548994;
              loc.longPos = 126.91887455532066;
              
        }else if ($(a3).val() == '용전동') {
              loc['latPos'] = 35.238849727994236;
              loc.longPos = 126.89683192049458;
              
        }else if ($(a3).val() == '생용동') {
              loc['latPos'] = 35.225425145057464;
              loc.longPos = 126.89982457226147;
              
        }else if ($(a3).val() == '월출동') {
              loc['latPos'] = 35.24050035689718;
              loc.longPos = 126.86904004922746;
              
        }else if ($(a3).val() == '오룡동') {
              loc['latPos'] = 35.22832045756085;
              loc.longPos = 126.8484578388095;
              
        }else if ($(a3).val() == '중앙동') {
              loc['latPos'] = 35.15668649211957;
              loc.longPos = 126.90572403569598;
              
        }else if ($(a3).val() == '문화동') {
              loc['latPos'] = 35.184037331037835;
              loc.longPos = 126.94043718369629;
              
        }

        console.log(loc.latPos);
        console.log(loc.longPos);

        // ***지도에 마커 표시 라이브러리  
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = { 
          
          center: new kakao.maps.LatLng(loc.latPos,loc.longPos), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
            };
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성
        var marker = new kakao.maps.Marker({ // 지도를 클릭한 위치에 표출할 마커
            position: map.getCenter() // 지도 중심좌표에 마커를 생성합니다 
        }); 
        marker.setMap(map);// 지도에 마커를 표시합니다
        // 지도에 클릭 이벤트를 등록합니다
        // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
           console.log(mouseEvent);
           var latlng = mouseEvent.latLng; // 클릭한 위도, 경도 정보를 가져옵니다 
            marker.setPosition(latlng);// 마커 위치를 클릭한 위치로 옮깁니다
            var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            message += '경도는 ' + latlng.getLng() + ' 입니다';
            console.log(message);
        });
        
        // ***인포윈도우 생성 코드 
        var iwContent = '<div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent
        });
        // 마커에 마우스오버 이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker); // 마커에 마우스아웃시 인포윈도우 추가
        });
        // 마커에 마우스아웃 이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close(); // 마커에 마우스아웃시 인포윈도우 제거
        });
        
        //&libraries=services,clusterer,drawing 지도와 함께 쓰는 라이브러리 
        // 1) services : 장소 검색, 주소를 좌표로 변환해주는 라이브러리 
        // 2) clusterer : 마커를 찍어줄 수 있는 라이브러리 
        // 3) drawing : 지도 위에 마커,그래픽 찍기 

        
        
         });
        
        

   }
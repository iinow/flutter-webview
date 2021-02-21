// const appKey = '1e40426f3b6c5127cd7237c62fe56cee'
let map = null
let place = null

document.addEventListener("DOMContentLoaded", function() {
  const container = document.getElementById('map');
  const options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),
    level: 5
  };

  map = new kakao.maps.Map(container, options);
  place = new kakao.maps.services.Places();
});

function searchPlaces(keyword) {
  if(!keyword) {
    return false;
  }
  // findSearchMap.postMessage(keyword)
  place.keywordSearch(keyword, searchCallback);
  return true;
}

function searchCallback(data, status, pagination) {
  if(status === kakao.maps.services.Status.OK) {
    console.log('검색 결과', data, 'paging', pagination)
    findSearchMap.postMessage(JSON.stringify(data))
    return;
  }

  if(status === kakao.maps.services.Status.ZERO_RESULT) {
    return;
  }

  if(status === kakao.maps.services.Status.ERROR) {
    return;
  }
}

    // <button onclick="onclickTest()">테스트1</button>
    //   <p id="tag"></p>
    // <script>
    //   function onclickTest() {
    //     console.log('테스트 1 클릭')
    //     try {
    //       alert('kdfjakdfj');
    //       test.postMessage('하하하하..')
    //     } catch (err) {

    //     }
    //   }

    //   function handleAppToWeb(str = 'hell') {
    //       document.getElementById('tag').textContent = str
    //   }
    // </script>
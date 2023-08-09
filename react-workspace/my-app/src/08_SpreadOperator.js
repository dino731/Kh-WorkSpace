import { useCallback, useState } from "react";
/* 
    전개연산자?
    ...점 3개를 연달아서 사용하는 연산자로 여러개의 객체를 '병합'하여
    한개의 객체로 만들려고 할 때 사용. (깊은 복사를 일으킨다)

    얕은 복사 -> 주소값만 복사하는 것으로 , 복사본에서 작업, 수정한 내용이 원본에 영향을 끼치는 복사
 */

const jeans = [1,2,3]; // 
const newJeans = [...jeans,4,5]; // [1,2,3,4,5]
// 전개 연산자를 활용한 이미지 추가기능
function Spread(){
  const [images, setImages] = useState([]);
  // images 변수에 빈 배열 등록

  const addImage = useCallback(() =>{
      const random = randomImages();
      const newImage = {
        id : random,
        src : `./img/flower${random}.jpg` 
        // 정적인 이미지 파일들은 모두 public 패키지안에 보관한다. 현재 위치는 public이다.
      }
      setImages([...images, newImage]);
      /* 
          state의 images변수에 이전 값들(...images)과 새롭게 생성된 이미지 객체를 함께 전달하여 수정한다.
      */
  },[images]);

  const clearImage = () => {setImages([])};
  const randomImages = () => Math.ceil(Math.random()*5);
  // [].map(콜백 함수)
  return(
   
    <>
      {console.log(images)}
      {
        images.map(
          (img) => <img src={img.src}/>  // 꺽쇠? 중괄호 가 return을 대신함 저게 없으면 return을 작성해줘야한다.
        )

      }
      <button id='add' onClick={addImage}>이미지 추가</button>
      <button id='clear' onClick={clearImage}>이미지 삭제</button>
    </>
  )

}
export default Spread;
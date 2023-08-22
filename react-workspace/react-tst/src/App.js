import React, { useState } from 'react';
import styled from 'styled-components';
import './App.css';

const First = () => {
  const [file, setFile] = useState({});

  const imageUpload = e => {
    const imageTpye = e.target.files[0].type.includes('image');
    const videoTpye = e.target.files[0].type.includes('video');

    setFile({
      url: URL.createObjectURL(e.target.files[0]),
      image: imageTpye,
      video: videoTpye,
    });
    console.log(imageTpye);
  };

  return (
    <Wrap>
      <div className='videoWrap'>
        <h1>제목</h1>
        <div className='videoplayer'>
          <span>{file.video && <video src={file.url} controls width="300px" />}</span>
          <span>{file.image && <img src={file.url} />}</span>
        </div>
        <div className='videoFileUploader'>
          <input  type="file" onChange={imageUpload} />
        </div>
      </div>
    </Wrap>
  );
};


const Wrap = styled.div`
  border: 1px solid gray;
  padding: 100px;
`;

export default First;
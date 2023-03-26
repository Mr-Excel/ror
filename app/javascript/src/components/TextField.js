import PropTypes from 'prop-types';
import React, { useState,useEffect } from 'react';
import {Div,Label,Input,IconSpan} from "../Styles/Input.styled.js"
import {AiFillEye,AiFillEyeInvisible} from "react-icons/ai"


const TextField = ({id,type,label,placeholder,onChange,value}) => {

  const [customType,setCustomType] = useState(type)

  const toggleIcon = (value) => {
    if(customType == "password"){
      setCustomType("email")
    } else {
      setCustomType("password")
    }
    // setCustomType()
  }
  
  return (
    <Div>
      <Input type={customType} id={id} value={value} placeholder=" " onChange={onChange} />
      <Label htmlFor={id}>{label}</Label>
      <IconSpan onClick={toggleIcon}>
      {
        ( type == "password" ) ? (
          (customType == "password") ? <AiFillEye/> : <AiFillEyeInvisible/>
        ) : ("")
      }
      </IconSpan>

    </Div>
  );
};

// this is passed from the Rails view
TextField.propTypes = {
  type: PropTypes.string.isRequired,
  id: PropTypes.string.isRequired,
  label: PropTypes.string.isRequired,
  placeholder: PropTypes.string,
  value: PropTypes.string.isRequired,
};

export default TextField;

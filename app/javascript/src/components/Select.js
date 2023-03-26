import PropTypes from 'prop-types';
import React, { useState,useEffect } from 'react';
import {Div,Label,Select,OptionTag} from "../Styles/select.styled.js"
import {AiFillEye,AiFillEyeInvisible} from "react-icons/ai"


const SelectTag = ({id,type,label,placeholder,onChange,value,data}) => {

  const [selected,setSelected] = useState(false)
  const [listData,setListData] = useState(data)
  const check = (e) => {
  const val = e.target.value
    if (val === '') {
       setSelected(false)
    } else {
      setSelected(true)
    }
  }

  useEffect(()=>{
    if(value == null || value == undefined || value == ''){
      setSelected(false)
    } else {
      setSelected(true)
    }
  },[value])

  return (
   <Div>
    
    <Select defaultValue={value}  id={id} onChange={check} className={selected ? 'select has-value': 'select'}>
      <OptionTag value=""></OptionTag>
      {listData.map(obj=>{
        return (<OptionTag key={obj.id} value={obj.id}>{obj.label}</OptionTag>)
      })}
    </Select>
    <Label htmlFor={id} className="label">{label}</Label>
  </Div>
  );
};

// this is passed from the Rails view
SelectTag.propTypes = {
  data: PropTypes.array.isRequired,
  id: PropTypes.string.isRequired,
  label: PropTypes.string.isRequired,
  placeholder: PropTypes.string,
  value: PropTypes.string.isRequired,
};

export default SelectTag;

import PropTypes from 'prop-types';
import React, { useState } from 'react';
import {Button} from "../Styles/button.styled.js"


const ButtonTag = ({children,onClick}) => {

  return (
    <Button onClick={onClick}>{children}</Button>
  );
};

// this is passed from the Rails view
ButtonTag.propTypes = {
  // label: PropTypes.string.isRequired,
};

export default ButtonTag;

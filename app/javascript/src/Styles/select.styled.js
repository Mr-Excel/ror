import styled from "styled-components"

export const Div = styled.div`
  position: relative;
  width: 250px;
  gap: 5px;
  display: flex;
  flex-direction: column;
`;

export const Label = styled.label`
  position: absolute;
  font-size: 15px;
  top: 20px;
  left: 15px;
  font-weight: 600;
  transition: 0.2s ease-in-out;
`

export const Select = styled.select`
  position: relative;
  padding-top: 20px;
  padding-left: 15px;
  padding-right: 15px;
  padding-bottom: 10px;
  font-size: 15px;
  outline: none;
  border: 1px solid #1e427590;
  border-radius: 2px;
  transition: 0.2s ease-in-out;
  margin: 5px;

  transition: border-bottom-color 0.3s ease-out;
  
  &:focus +.label, &.has-value + .label {
      font-size: 12px;
      top: 8px;
      left: 10px;
      color: #1e4275;
  }

`

export const OptionTag = styled.option`
  padding: 10px;
  font-size: 16px;
  background-color: #f2f2f2;
  color: #333;
  transition: background-color 0.2s ease-in-out;
  &:hover{
    background-color: #ddd;
  }
`
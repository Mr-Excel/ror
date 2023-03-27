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

export const Input = styled.input`
  position: relative;
  padding-top: 20px;
  padding-left: 15px;
  padding-right: 30px;
  padding-bottom: 10px;
  font-size: 15px;
  outline: none;
  border: 1px solid #1e427590;
  border-radius: 2px;
  transition: 0.2s ease-in-out;
  margin: 5px;

  &:focus  {
    border-color: #1e427560;
  }

  &:focus + label,
  &:not(:placeholder-shown) + label {
    font-size: 12px;
    top: 8px;
    left: 10px;
    color: #1e4275;
  }
`

export const IconSpan = styled.span`
  right: 10px;
  top: 20px;
  font-size: 15px;
  position: absolute !important;
  cursor: pointer;

  & svg{
    font-size: 20px;
    transition: 0.3s ease-in-out;
    color: gray;

    &:hover{
      color: #1e4275
    }
  }
`
import PropTypes from "prop-types";
import React, { useState, useEffect } from "react";
import TextField from "../components/TextField";
import SelectTag from "../components/Select";
import Button from "../components/Button";
import axios from "axios";
import { ToastContainer, toast } from "react-toastify";

const LoginPage = (props) => {
  const [user, setUser] = useState(props.user);

  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");
  const [email, setEmail] = useState("aaa@g.com");
  const [password, setPassword] = useState("123456");
  const [gender, setGender] = useState("1");
  const [dateOfBirth, setDateOfBirth] = useState("1996-06-12");
  const [confirmPassword, setConfirmPassword] = useState("123456");

  const notify = () => toast("Wow so easy!");
  const handleInputChange = (event, field) => {
    switch (field) {
      case "email":
        setEmail(event.target.value);
        break;
      case "password":
        setPassword(event.target.value);
        break;
      case "gender":
        setGender(event.target.value);
        break;
      case "dateOfBirth":
        setDateOfBirth(event.target.value);
        break;
      case "firstName":
        setFirstName(event.target.value);
        break;
      case "lastName":
        setLastName(event.target.value);
        break;
      case "confirmPassword":
        setConfirmPassword(event.target.value);
        break;
      default:
        break;
    }
  };

  const save = () => {
    const user = {
      first_name: firstName,
      last_name: lastName,
      password: password,
      password_confirmation: confirmPassword,
      email: email,
      date_of_birth: dateOfBirth,
      gender: gender,
    };

    const token = document.querySelector("[name=csrf-token]").content;

    axios.defaults.headers.common["X-CSRF-TOKEN"] = token;
    axios.post("/users", { user }).then(function (response) {
      const { code, data, msg } = response.data;
      if (code !== 200) {
        const messages = msg.join(", ");
        toast.error(messages, {
          position: "top-right",
          autoClose: 5000,
          hideProgressBar: false,
          closeOnClick: true,
          pauseOnHover: true,
          draggable: true,
          progress: undefined,
          theme: "light",
        });
      } else {
        window.location.replace("/");
      }
    });
  };

  return (
    <div>
      <ToastContainer />
      <TextField
        id='firstName'
        type='text'
        placeholder='firstName'
        label='First Name'
        value={firstName}
        onChange={(e) => handleInputChange(e, "firstName")}
      />

      <TextField
        id='lastName'
        type='text'
        placeholder='lastName'
        label='Last Name'
        value={lastName}
        onChange={(e) => handleInputChange(e, "lastName")}
      />

      <TextField
        id='email'
        type='email'
        placeholder='Email'
        label='Email'
        value={email}
        onChange={(e) => handleInputChange(e, "email")}
      />

      <TextField
        id='password'
        type='password'
        placeholder='Password'
        label='Password'
        value={password}
        onChange={(e) => handleInputChange(e, "password")}
      />

      <TextField
        id='confirmPassword'
        type='password'
        placeholder='confirmPassword'
        label='Confirm Password'
        value={confirmPassword}
        onChange={(e) => handleInputChange(e, "confirmPassword")}
      />

      <SelectTag
        id='gender'
        data={[
          {
            id: 0,
            label: "Male",
          },
          {
            id: 1,
            label: "Female",
          },
        ]}
        placeholder='Select Gender'
        label='Select Gender'
        value={gender}
        onChange={(e) => handleInputChange(e, "gender")}
      />

      <TextField
        id='dateOfBirth'
        type='date'
        placeholder='dateOfBirth'
        label='Date of Borth'
        value={dateOfBirth}
        onChange={(e) => handleInputChange(e, "dateOfBirth")}
      />

      <Button onClick={save}>Save</Button>
    </div>
  );
};
// this is passed from the Rails view
LoginPage.propTypes = {
  user: PropTypes.object.isRequired,
};

export default LoginPage;

import PropTypes from "prop-types";
import React, { useState, useEffect } from "react";
import axios from "axios";
import Button from "../../components/Button";
import { ToastContainer, toast } from "react-toastify";

const AllUsersPage = ({ users }) => {
  const logout = () => {
    const token = document.querySelector("[name=csrf-token]").content;

    axios.defaults.headers.common["X-CSRF-TOKEN"] = token;
    axios.delete("/users/sign_out").then(function (response) {
      const { code, data, msg } = response.data;

      if (code !== 200) {
        toast.error(msg, {
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
      <Button onClick={logout}>Logout</Button>
      <ul>
        {users.map((user, index) => (
          <li key={index}>
            <strong>{user.first_name + " " + user.last_name}</strong>
            <ul>
              <li>
                <strong>Email: </strong> {user.email}
                <br />
                <strong>Gender: </strong> {user.gender}
                <br />
                <strong>Date Of Birth: </strong> {user.date_of_birth}
              </li>
            </ul>
          </li>
        ))}
      </ul>
    </div>
  );
};

// this is passed from the Rails view
AllUsersPage.propTypes = {
  users: PropTypes.array.isRequired,
};

export default AllUsersPage;

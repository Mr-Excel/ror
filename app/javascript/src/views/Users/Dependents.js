import axios from "axios";
import PropTypes from "prop-types";
import React, { useEffect, useState } from "react";
import PartialDependent from "./_Dependents";

const TeamsPage = (props) => {
  const [user] = useState(props.user);
  const [dependents] = useState(props.dependents);
  const [id, setId] = useState(0);
  const [data, setData] = useState([<PartialDependent id={0} />]);

  const add = () => {
    const nextId = id + 1;
    setId(nextId);
    data.push(<PartialDependent key={nextId} id={nextId} />);
  };
  return (
    <React.Fragment>
      <div>{data}</div>
      <button type='button' onClick={add}>
        Add More Dependents
      </button>
    </React.Fragment>
  );
};

TeamsPage.propTypes = {
  user: PropTypes.object.isRequired,
  dependents: PropTypes.array.isRequired,
};

export default TeamsPage;

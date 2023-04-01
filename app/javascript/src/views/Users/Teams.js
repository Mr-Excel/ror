import PropTypes from "prop-types";
import React, { useState } from "react";

const TeamsPage = (props) => {
  const [id] = useState(props.id);
  const [name] = useState(props.name);
  return (
    <React.Fragment>
      <input
        type='checkbox'
        value={id}
        style={{ marginRight: "10px" }}
        name={`user[user_teams_attributes][${id - 1}][team_id]`}
        id={`user_user_teams_attributes_${id - 1}_team_id`}
      />
      <label
        className='form-check-label'
        htmlFor={`user_user_teams_attributes_${id - 1}_team_id`}
      >
        {name}
      </label>
    </React.Fragment>
  );
};

TeamsPage.propTypes = {
  id: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
};

export default TeamsPage;

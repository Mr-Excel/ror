import axios from "axios";
import PropTypes from "prop-types";
import React, { useEffect, useState } from "react";

const DependentPartialPage = (props) => {
  const [paramName, setParamName] = useState("dependents_attributes");
  const [id, setId] = useState(props.id);
  const [relationships, setRelationships] = useState([]);
  const [relationshipId, setRelationshipId] = useState("");
  const [name, setName] = useState("");
  const [gender, setGender] = useState("");

  useEffect(() => {
    const token = document.querySelector("[name=csrf-token]").content;
    axios.defaults.headers.common["X-CSRF-TOKEN"] = token;
    axios.get("/relationships").then(function ({ data }) {
      setRelationships(data);
    });
  }, []);
  return (
    <React.Fragment>
      <div className='row'>
        <div className='col mb-3'>
          <label
            className='form-label'
            htmlFor={`user_${paramName}_${id}_name`}
          >
            Name
          </label>
          <input
            type='text'
            name={`user[${paramName}][${id}][name]`}
            id={`user_${paramName}_${id}_name`}
            value={name}
            className='form-control'
            onChange={(e) => setName(e.target.value)}
          />
        </div>
        <div className='col mb-3'>
          <label
            className='form-label'
            htmlFor={`user_${paramName}_${id}_gender`}
          >
            Gender
          </label>
          <select
            type='text'
            name={`user[${paramName}][${id}][gender]`}
            id={`user_${paramName}_${id}_gender`}
            value={gender}
            className='form-control'
            onChange={(e) => setGender(e.target.value)}
          >
            <option value='0'>Male</option>
            <option value='0'>Female</option>
          </select>
        </div>
        <div className='col mb-3'>
          <label
            className='form-label'
            htmlFor={`user_${paramName}_${id}_relationship_id`}
          >
            RelationShips
          </label>
          <select
            type='text'
            name={`user[${paramName}][${id}][relationship_id]`}
            id={`user_${paramName}_${id}_relationship_id`}
            value={relationshipId}
            className='form-control'
            onChange={(e) => setRelationshipId(e.target.value)}
          >
            {relationships
              ? relationships.map((r) => (
                  <option key={r.id} value={r.id}>
                    {r.name}
                  </option>
                ))
              : []}
          </select>
        </div>
      </div>
    </React.Fragment>
  );
};

DependentPartialPage.propTypes = {
  id: PropTypes.number.isRequired,
};

export default DependentPartialPage;


Number.RANDOM = (number = 5) =>{
  str = "0"
  for( let i = 0; i < number; i++ ){
    str += 9-i
  }
  return Math.floor(Math.random()*Number(str))
}

Number.prototype.to_px = function () {
  return this.toString()+"px"
}

String.prototype.checkPassword = function () {
  const p = this;
  const errors = [];
    if (p.length < 8) {
        errors.push("Your password must be at least 8 characters"); 
    }
    if (p.search(/[a-z]/i) < 0) {
        errors.push("Your password must contain at least one letter.");
    }
    if (p.search(/[0-9]/) < 0) {
        errors.push("Your password must contain at least one digit."); 
    }
    if (errors.length > 0) {
        alert(errors.join("\n"));
        return false;
    }
    return true;
}
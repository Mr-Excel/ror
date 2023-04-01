import ReactOnRails from "react-on-rails";
import jQuery from "jquery";
import axios from "axios";
import Views from "../src";
window.jQuery = jQuery;
window.axios = axios;

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register(Views);

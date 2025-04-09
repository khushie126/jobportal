// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import '@fortawesome/fontawesome-free/css/all.min.css';

import "./controllers"
import * as bootstrap from "bootstrap"
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

require("@nathanvda/cocoon")
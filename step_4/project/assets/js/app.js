import "phoenix_html"

import Elm from "./main"

const socketUrl = window.socketUrl;
const node = document.getElementById("elm_target");
const app = Elm.Main.embed(node, {socketUrl});

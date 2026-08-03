const name = "This is Node js";
let price = 20.32;
var va = "";

function Sum(a, b) {
  return a + b;
}

const SumNumber = (a, b, c) => a + b + c;

const listOb = {
  name: "nita",
  age: 20,
};

const lsitArray = [20, 20, 33, 343];
for (var i of lsitArray) {
  console.log(i);
}

function Service() {
  return;
}

module.exports = Service;

exports.Services = {};

const os = require("os");
console.log("OS Platform:", os.platform());
console.log("Total Memory (GB):", os.totalmem() / 1024 ** 3);

const path = require("path");
const fullPath = path.join(__dirname, "files", "data.txt");
console.log("Full Path:", fullPath);

const fs = require("fs");
fs.writeFileSync("example.txt", "Hello from Node core!");
const content = fs.readFileSync("example.txt", "utf-8");
console.log("File Content:", content);

const crypto = require("crypto");
const hash = crypto.createHash("sha256").update("hello").digest("hex");
console.log("SHA256 Hash:", hash);
const id = crypto.randomUUID();
console.log("Random UUID:", id);

const events = require("events");
const emitter = new events.EventEmitter();
emitter.on("greet", (name) => console.log("Hello", name));
emitter.emit("greet", "Node.js");

const http = require("http");
const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/plain" });
  res.end("Hello from Node.js core http module!");
});
server.listen(3001, () => console.log("Demo server at http://localhost:3001"));

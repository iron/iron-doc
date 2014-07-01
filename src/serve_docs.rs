extern crate iron;
extern crate staticfile;
extern crate mount;

use std::io::net::ip::Ipv4Addr;
use iron::{Iron, ServerT, Chain};
use staticfile::Static;
use mount::Mount;

fn main() {
    let mut server: ServerT = Iron::new();
    // Serve documentation
    server.chain.link(Static::new(Path::new("core/doc/")));
    // Serve index.html
    server.chain.link(Static::new(Path::new("core/doc/iron/")));
    server.listen(Ipv4Addr(100, 82, 34, 85), 80);
}

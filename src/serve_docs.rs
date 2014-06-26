extern crate iron;
extern crate staticfile;
extern crate mount;

use std::io::net::ip::Ipv4Addr;
use iron::{Iron, ServerT, Chain};
use staticfile::Static;
use mount::Mount;

fn main() {
    let mut server: ServerT = Iron::new();
    // Serve core documentation
    server.chain.link(Mount::new("/core", Static::new(Path::new("core/doc/"))));
    // Serve core's index.html (from iron)
    server.chain.link(Mount::new("/core", Static::new(Path::new("core/doc/iron/"))));
    // Serve Iron documentation
    server.chain.link(Static::new(Path::new("iron/doc/")));
    // Serve Iron's index.html
    server.chain.link(Static::new(Path::new("iron/doc/iron/")));
    server.listen(Ipv4Addr(127, 0, 0, 1), 80);
}

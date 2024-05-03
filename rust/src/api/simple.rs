#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

#[flutter_rust_bridge::frb(opaque)]
pub struct OpaqueData {
    pub data: u64,
}

#[flutter_rust_bridge::frb(sync)]
pub fn make_data() -> OpaqueData {
    OpaqueData { data: 0 }
}

pub fn get_data(data: &OpaqueData) -> u64 {
    data.data
}

pub fn mutate_data(data: &mut OpaqueData) {
    data.data += 1;
}
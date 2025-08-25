-- Create the table to hold customer asset information
CREATE TABLE customer_assets (
    asset_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id INT NOT NULL, -- To identify which customer owns the asset
    hostname VARCHAR(255),
    ip_address INET,
    os_cpe VARCHAR(255),
    installed_software_cpes JSONB,
    last_scanned TIMESTAMPTZ
);
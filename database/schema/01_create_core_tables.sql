-- Create the cves table to hold all NVD data
CREATE TABLE cves (
    cve_id VARCHAR(20) PRIMARY KEY,
    cwe_id VARCHAR(50),
    description TEXT,
    cvss_score NUMERIC(3, 1),
    cvss_vector VARCHAR(100),
    published_date TIMESTAMPTZ,
    latest_updated_date TIMESTAMPTZ,
    reference_links JSONB  -- Renamed from 'references'
);

-- Create the kev table for CISA's Known Exploited Vulnerabilities
CREATE TABLE kev (
    cve_id VARCHAR(20) PRIMARY KEY REFERENCES cves(cve_id) ON DELETE CASCADE,
    due_date DATE,
    vulnerability_name TEXT
);

-- Create the vendors table
CREATE TABLE vendors (
    vendor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Create the advisories table to hold vendor-specific bulletins
CREATE TABLE advisories (
    advisory_id SERIAL PRIMARY KEY,
    vendor_id INT NOT NULL REFERENCES vendors(vendor_id) ON DELETE CASCADE,
    title TEXT,
    severity VARCHAR(50),
    initial_release_date TIMESTAMPTZ,
    vendor_advisory_id VARCHAR(100),
    UNIQUE (vendor_id, vendor_advisory_id)
);
-- Create the many-to-many mapping between advisories and CVEs
CREATE TABLE advisory_cve_map (
    advisory_id INT NOT NULL REFERENCES advisories(advisory_id) ON DELETE CASCADE,
    cve_id VARCHAR(20) NOT NULL REFERENCES cves(cve_id) ON DELETE CASCADE,
    PRIMARY KEY (advisory_id, cve_id)
);

-- Create the mapping between advisories and affected products (CPEs)
CREATE TABLE advisory_product_map (
    qs_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    advisory_id INT NOT NULL REFERENCES advisories(advisory_id) ON DELETE CASCADE,
    affected_product_cpe VARCHAR(255) NOT NULL,
    recommendations JSONB
);
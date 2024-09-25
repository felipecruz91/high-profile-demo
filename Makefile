APP_DIR ?= app

all: gen-sbom edit-sbom-curl edit-sbom-lighttpd build-scratch scout-cves

gen-sbom:
	cd $(APP_DIR) && docker buildx build -t felipecruz319/high-profile-demo . -f Dockerfile --load
	docker scout sbom felipecruz319/high-profile-demo --platform linux/arm64 --format spdx -o sbom.spdx.json

# Edit SBOM to lower curl package version below 8.4.0-r0 to be vulnerable to CVE-2023-38545
edit-sbom-curl:
	@sed -i '' 's|8.5.0-r0|8.3.0-r0|g' sbom.spdx.json

# Edit SBOM to lower lighttpd package version below 8.4.0-r0 to be vulnerable to CVE-2023-38545
edit-sbom-lighttpd:
	@sed -i '' 's|1.4.76-r0|1.4.75-r0|g' sbom.spdx.json

build-scratch:
	docker buildx build -t felipecruz319/high-profile-demo . -f Dockerfile.sbom --load

scout-cves:
	docker scout cache prune --sboms --force
	docker scout cves felipecruz319/high-profile-demo --only-cve-id CVE-2023-38545,CVE-2023-44487,CVE-2024-3094 --org felipecruz319

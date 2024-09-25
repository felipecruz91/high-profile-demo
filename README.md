# high-profile-demo

This image contains the following high-profile vulnerabilities:

- CVE-2023-38545 (cURL SOCKS5 heap buffer overflow)
- CVE-2023-44487 (HTTP/2 Rapid Reset)
- CVE-2024-3094 (XZ backdoor)

# Quick Start

```bash
make all
```

## Output
```bash
docker scout cves felipecruz319/high-profile-demo --only-cve-id CVE-2023-38545,CVE-2023-44487,CVE-2024-3094 --org felipecruz319
✓ Image stored for indexing
    ✓ Indexed 43 packages
    ✓ 2 exceptions obtained
    ✗ Detected 3 vulnerable packages with a total of 3 vulnerabilities


## Overview

                    │              Analyzed Image
────────────────────┼───────────────────────────────────────────
  Target            │  felipecruz319/high-profile-demo:latest
    digest          │  fef56b0e73a4
    platform        │ linux/arm64/v8
    vulnerabilities │    2C     0H     1M     0L
    size            │ 2.8 MB
    packages        │ 43


## Packages and Vulnerabilities

   1C     0H     0M     0L  lighttpd 1.4.75-r0
pkg:apk/alpine/lighttpd@1.4.75-r0?os_name=alpine&os_version=3.15

    ✗ CRITICAL CVE-2024-3094
      https://scout-stage.docker.com/v/CVE-2024-3094
      Affected range  : <1.4.76-r0
      Fixed version   : 1.4.76-r0
      EPSS Score      : 14.45%
      EPSS Percentile : 96th percentile


   1C     0H     0M     0L  curl 8.3.0-r0
pkg:apk/alpine/curl@8.3.0-r0?os_name=alpine&os_version=3.15

    ✗ CRITICAL CVE-2023-38545
      https://scout-stage.docker.com/v/CVE-2023-38545
      Affected range  : <8.4.0-r0
      Fixed version   : 8.4.0-r0
      EPSS Score      : 0.27%
      EPSS Percentile : 68th percentile


   0C     0H     1M     0L  google.golang.org/grpc 1.57.0
pkg:golang/google.golang.org/grpc@1.57.0

    ✗ MEDIUM CVE-2023-44487 [Uncontrolled Resource Consumption]
      https://scout-stage.docker.com/v/CVE-2023-44487
      Affected range  : >=1.57.0
                      : <1.57.1
      Fixed version   : 1.57.1
      CVSS Score      : 5.3
      CVSS Vector     : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:L
      EPSS Score      : 81.63%
      EPSS Percentile : 98th percentile



3 vulnerabilities found in 3 packages
  CRITICAL  2
  HIGH      0
  MEDIUM    1
  LOW       0
```

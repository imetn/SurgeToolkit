"""Regression guard for T3's dedicated AI domains, without shared CDN expansion."""
from pathlib import Path
import unittest


class T3Rules(unittest.TestCase):
    def test_dedicated_suffixes_cover_official_hosts(self):
        lines = (Path(__file__).resolve().parents[2] / "Rules/ai.list").read_text().splitlines()
        for domain in ("t3.codes", "t3coderelay.com", "t3.chat"):
            self.assertEqual(lines.count(f"DOMAIN-SUFFIX,{domain}"), 1)
        suffixes = [line.split(",")[1] for line in lines if line.startswith("DOMAIN-SUFFIX,")]
        for host in ("t3.codes", "app.t3.codes", "clerk.t3.codes", "relay.t3.codes",
                     "nightly.app.t3.codes", "latest.app.t3.codes", "ingest.t3.codes",
                     "t3.chat", "clerk.t3.chat", "prod-test.t3coderelay.com"):
            self.assertTrue(any(host == s or host.endswith("." + s) for s in suffixes), host)
        for unrelated in ("github.com", "clerk.com", "clerk.accounts.dev", "trycloudflare.com", "t3.sh"):
            self.assertNotIn(f"DOMAIN-SUFFIX,{unrelated}", lines)


if __name__ == "__main__":
    unittest.main()

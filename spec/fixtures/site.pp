
import "../../manifests/roles/*.pp"
import "../../manifests/nodes/*.pp"

$extlookup_datadir = "spec/fixtures"
$extlookup_precedence = ["%{fqdn}", "domain_%{domain}", "common"]

Service {
  hasstatus => false,
}

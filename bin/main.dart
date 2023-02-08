import 'package:design_pattern/EcuM/phase.dart';

void main(List<String> arguments) {
  var ecuMPhaseContext = EcuMPhaseContext(EcuMPhaseStartup(EcuMSequenceStartPreOs()));
  ecuMPhaseContext.osStart();
  ecuMPhaseContext.initialize();
}

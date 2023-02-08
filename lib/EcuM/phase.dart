abstract class EcuMPhase {
  EcuMSequenceContext sequenceContext = EcuMSequenceContext(EcuMSequenceStartPreOs());

  void osStartHandler(EcuMPhaseContext context);
  void initializeHandler(EcuMPhaseContext context);
  void enterSleep(EcuMPhaseContext context);
  void sleep(EcuMPhaseContext context);
  void goUp(EcuMPhaseContext context);
  void enterShutdown(EcuMPhaseContext context);
  void deinitializeHandler(EcuMPhaseContext context);

  @override
  String toString();
}

class EcuMPhaseStartup implements EcuMPhase {
  @override
  EcuMSequenceContext sequenceContext;

  EcuMPhaseStartup(EcuMSequence seaquence) : sequenceContext = EcuMSequenceContext(EcuMSequenceStartPreOs()){
    print('in EcuMPhaseStartup');
  }

  @override
  osStartHandler(EcuMPhaseContext context) {
    print('EcuMPhaseStartup: osStartHandler');
    sequenceContext.process();
  }

  @override
  initializeHandler(EcuMPhaseContext context) {
    print('EcuMPhaseStartup: initializeHandler');
    sequenceContext.process();
    context.phase = EcuMPhaseUp();
  }

  @override
  enterSleep(EcuMPhaseContext context) {
    print('EcuMPhaseStartup: enterSleep');
    /// nop
  }

  @override
  sleep(EcuMPhaseContext context) {
    print('EcuMPhaseStartup: sleep');
    /// nop
  }

  @override
  goUp(EcuMPhaseContext context) {
    print('EcuMPhaseStartup: goUp');
    /// nop
  }

  @override
  enterShutdown(EcuMPhaseContext context) {
    print('EcuMPhaseStartup: enterShutdown');
    /// nop
  }

  @override
  deinitializeHandler(EcuMPhaseContext context) {
    print('EcuMPhaseStartup: deinitializeHandler');
    /// nop
  }

  @override String toString() {
    return 'Startup';
  }
}

class EcuMPhaseUp implements EcuMPhase {
  @override
  EcuMSequenceContext sequenceContext;

  EcuMPhaseUp() : sequenceContext = EcuMSequenceContext(EcuMSequenceUp()){
    print('in EcuStatusUp');
  }

  @override
  osStartHandler(EcuMPhaseContext context) {
    print('EcuMPhaseUp: osStartHandler');
    /// nop
  }

  @override
  initializeHandler(EcuMPhaseContext context) {
    print('EcuMPhaseUp: initializeHandler');
    /// nop
  }

  @override
  enterSleep(EcuMPhaseContext context) {
    print('EcuMPhaseUp: enterSleep');
    context.phase = EcuMPhaseSleep();
  }

  @override
  sleep(EcuMPhaseContext context) {
    print('EcuMPhaseUp: sleep');
    /// nop
  }

  @override
  goUp(EcuMPhaseContext context) {
    print('EcuMPhaseUp: goUp');
    /// nop
  }

  @override
  enterShutdown(EcuMPhaseContext context) {
    print('EcuMPhaseUp: enterShutdown');
    /// nop
  }

  @override
  deinitializeHandler(EcuMPhaseContext context) {
    print('EcuMPhaseUp: deinitializeHandler');
    /// nop
  }

  @override String toString() {
    return 'EcuMPhaseUp';
  }
}

class EcuMPhaseSleep implements EcuMPhase {
  @override
  EcuMSequenceContext sequenceContext;

  /// TODO select sleep mode. default is halt.
  EcuMPhaseSleep() : sequenceContext = EcuMSequenceContext(EcuMSequenceGoSleep(EcuMSleepMode.halt)){
    print('in EcuMPhaseSleep');
  }

  @override
  osStartHandler(EcuMPhaseContext context) {
    print('EcuMPhaseSleep: osStartHandler');
    /// nop
  }

  @override
  initializeHandler(EcuMPhaseContext context) {
    print('EcuMPhaseSleep: initializeHandler');
    /// nop
  }

  @override
  enterSleep(EcuMPhaseContext context) {
    print('EcuMPhaseSleep: enterSleep');
    /// nop
  }

  @override
  sleep(EcuMPhaseContext context) {
    print('EcuMPhaseSleep: sleep');
    /// nop
  }

  @override
  goUp(EcuMPhaseContext context) {
    print('EcuMPhaseSleep: goUp');
    /// nop
  }

  @override
  enterShutdown(EcuMPhaseContext context) {
    print('EcuMPhaseSleep: enterShutdown');
    /// nop
  }

  @override
  deinitializeHandler(EcuMPhaseContext context) {
    print('EcuMPhaseSleep: deinitializeHandler');
    /// nop
  }

  @override String toString() {
    return 'EcuMPhaseSleep';
  }
}

class EcuMPhaseShutdown implements EcuMPhase {
  @override
  EcuMSequenceContext sequenceContext;

  EcuMPhaseShutdown() : sequenceContext = EcuMSequenceContext(EcuMSequenceOffPreOs()){
    print('in EcuShutdown');
  }

  @override
  osStartHandler(EcuMPhaseContext context) {
    print('EcuShutdown: osStartHandler');
    /// nop
  }

  @override
  initializeHandler(EcuMPhaseContext context) {
    print('EcuShutdown: initializeHandler');
    /// nop
  }

  @override
  enterSleep(EcuMPhaseContext context) {
    print('EcuShutdown: enterSleep');
    /// nop
  }

  @override
  sleep(EcuMPhaseContext context) {
    print('EcuShutdown: sleep');
    /// nop
  }

  @override
  goUp(EcuMPhaseContext context) {
    print('EcuShutdown: goUp');
    /// nop
  }

  @override
  enterShutdown(EcuMPhaseContext context) {
    print('EcuShutdown: enterShutdown');
    /// nop
  }

  @override
  deinitializeHandler(EcuMPhaseContext context) {
    print('EcuShutdown: deinitializeHandler');
    /// nop
  }

  @override String toString() {
    return 'EcuShutdown';
  }
}

class EcuMPhaseContext {
  EcuMPhase phase;

  EcuMPhaseContext(this.phase);

  void osStart() {
    print('os started');
    phase.osStartHandler(this);
  }

  void initialize() {
    print('initialize');
    phase.initializeHandler(this);
  }

  void enterSleep() {
    print('enter sleep');
    phase.sleep(this);
  }

  void sleep() {
    print('sleep');
  }

  // void enterHalt() {
  //   print('enter halt');
  //   phase.enterHaltHandler(this);
  // }

  // void wakeup() {
  //   print('wakeup');
  //   phase.wakeup(this);
  // }

  void shutdown() {
    print('shutdown');
    // phase.shutdownHandler(this);
  }

  void osShutdown() {
    print('osShutdown');
    // phase.shutdownHandler(this);
  }
}

abstract class EcuMSequence {
  void handler(EcuMSequenceContext context);

  @override
  String toString();
}

class EcuMSequenceStartPreOs implements EcuMSequence {
  @override
  handler(EcuMSequenceContext context){
    print('EcuMSequenceStartPreOs: handler');
    /// userCode()
    /// StartOs()
    context.sequence = EcuMSequenceStartPostOs();
  }
}

class EcuMSequenceStartPostOs implements EcuMSequence {
  @override
  handler(EcuMSequenceContext context){
    print('EcuMSequenceStartPostOs: handler');
    /// nop
  }
}

class EcuMSequenceUp implements EcuMSequence {
  @override
  handler(EcuMSequenceContext context){
    /// nop
    print('EcuMSequenceUp: handler');
  }
}

enum EcuMSleepMode{
  halt,
  pool,
}

class EcuMSequenceGoSleep implements EcuMSequence {
  const EcuMSequenceGoSleep(this.mode);

  final EcuMSleepMode mode;

  @override
  handler(EcuMSequenceContext context){
    print('EcuMSequenceGoSleep: handler');
    if( mode == EcuMSleepMode.pool ){
      context.sequence = EcuMSequencePoll();
    }
    else if( mode == EcuMSleepMode.halt ) {
      context.sequence = EcuMSequenceHalt();
    }
    else{
      /// TODO imprement exception
    }
  }
}

class EcuMSequencePoll implements EcuMSequence {
  @override
  handler(EcuMSequenceContext context){
    print('EcuMSequencePoll: handler');
    context.sequence = EcuMSequenceWakeUpRestart();
  }
}

class EcuMSequenceHalt implements EcuMSequence {
  @override
  handler(EcuMSequenceContext context){
    print('EcuMSequenceHalt: handler');
    context.sequence = EcuMSequenceWakeUpRestart();
  }
}

class EcuMSequenceWakeUpRestart implements EcuMSequence {
  @override
  handler(EcuMSequenceContext context){
    /// nop
    print('EcuMSequenceGoSleep: handler');
  }
}

class EcuMSequenceOffPreOs implements EcuMSequence {
  @override
  handler(EcuMSequenceContext context){
    /// nop
    print('EcuMSequenceOffPreOs: handler');
  }
}

class EcuMSequenceOffPostOs implements EcuMSequence {
  @override
  handler(EcuMSequenceContext context){
    /// nop
    print('EcuMSequenceOffPostOs: handler');
  }
}

class EcuMSequenceContext {
  EcuMSequence sequence;

  EcuMSequenceContext(this.sequence);

  void process() {
    print('EcuMSequenceContext: process');
    sequence.handler(this);
  }
}

// abstract class EcuMState {
//   @override
//   String toString();
// }

// class EcuMStateContext {
//   EcuMStateContext();
// }
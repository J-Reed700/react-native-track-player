import Foundation

class EventEmitter {

    public static var shared = EventEmitter()

    private var eventEmitter: RNTrackPlayer!

    func register(eventEmitter: RNTrackPlayer) {
        self.eventEmitter = eventEmitter
    }

    func emit(event: EventType, body: Any?) {
        guard let emitter = self.eventEmitter, emitter.bridge != nil else {
            return // bridge torn down or not yet attached — no listeners
        }
        emitter.sendEvent(withName: event.rawValue, body: body)
    }
}

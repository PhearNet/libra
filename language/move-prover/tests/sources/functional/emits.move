module TestEmits {
    use 0x1::Event::{Self, EventHandle};

    struct DummyEvent {
        msg: u64
    }

    // -------------------------
    // simple `emits` statements
    // -------------------------

    public fun simple(handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
    }
    spec fun simple {
        emits DummyEvent{msg: 0} to handle;
    }

    public fun simple_wrong_msg_incorrect(handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
    }
    spec fun simple_wrong_msg_incorrect {
        emits DummyEvent{msg: 1} to handle;
    }

    public fun simple_wrong_handle_incorrect(handle: &mut EventHandle<DummyEvent>, _handle2: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
    }
    spec fun simple_wrong_handle_incorrect {
        emits DummyEvent{msg: 0} to _handle2;
    }


    // ---------------
    // multiple events
    // ---------------

    public fun multiple(handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
        Event::emit_event(handle, DummyEvent{msg: 1});
    }
    spec fun multiple {
        emits DummyEvent{msg: 0} to handle;
        emits DummyEvent{msg: 1} to handle;
    }

    public fun multiple_incorrect(handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
        Event::emit_event(handle, DummyEvent{msg: 1});
    }
    spec fun multiple_incorrect {
        emits DummyEvent{msg: 0} to handle;
        emits DummyEvent{msg: 1} to handle;
        emits DummyEvent{msg: 2} to handle;
    }

    public fun multiple_same(handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
        Event::emit_event(handle, DummyEvent{msg: 0});
    }
    spec fun multiple_same {
        emits DummyEvent{msg: 0} to handle;
        emits DummyEvent{msg: 0} to handle;
    }

    public fun multiple_same_incorrect(handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
    }
    spec fun multiple_same_incorrect {
        emits DummyEvent{msg: 0} to handle;
        emits DummyEvent{msg: 0} to handle;
    }

    public fun multiple_different_handle(handle: &mut EventHandle<DummyEvent>, handle2: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
        Event::emit_event(handle2, DummyEvent{msg: 0});
    }
    spec fun multiple_different_handle {
        emits DummyEvent{msg: 0} to handle;
        emits DummyEvent{msg: 0} to handle2;
    }


    // ------------------------------
    // conditional `emits` statements
    // ------------------------------

    public fun conditional(x: u64, handle: &mut EventHandle<DummyEvent>) {
        if (x > 7) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        }
    }
    spec fun conditional {
        emits DummyEvent{msg: 0} to handle if x > 7;
    }

    public fun conditional_wrong_condition_incorrect(x: u64, handle: &mut EventHandle<DummyEvent>) {
        if (x > 7) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        }
    }
    spec fun conditional_wrong_condition_incorrect {
        emits DummyEvent{msg: 0} to handle if x > 0;
    }

    public fun conditional_missing_condition_incorrect(x: u64, handle: &mut EventHandle<DummyEvent>) {
        if (x > 7) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        }
    }
    spec fun conditional_missing_condition_incorrect {
        emits DummyEvent{msg: 0} to handle;
    }

    public fun conditional_bool(b: bool, handle: &mut EventHandle<DummyEvent>) {
        if (b) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        }
    }
    spec fun conditional_bool {
        emits DummyEvent{msg: 0} to handle if b;
    }

    public fun conditional_multiple(b0: bool, b1: bool, b2: bool, handle: &mut EventHandle<DummyEvent>) {
        if (b0) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        };
        if (b1) {
            Event::emit_event(handle, DummyEvent{msg: 1});
        };
        if (b2) {
            Event::emit_event(handle, DummyEvent{msg: 2});
        }
    }
    spec fun conditional_multiple {
        emits DummyEvent{msg: 0} to handle if b0;
        emits DummyEvent{msg: 1} to handle if b1;
        emits DummyEvent{msg: 2} to handle if b2;
    }

    public fun conditional_multiple_incorrect(b: bool, handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
        Event::emit_event(handle, DummyEvent{msg: 1});
        if (b) {
            Event::emit_event(handle, DummyEvent{msg: 2});
        }
    }
    spec fun conditional_multiple_incorrect {
        emits DummyEvent{msg: 0} to handle;
        emits DummyEvent{msg: 1} to handle;
        emits DummyEvent{msg: 2} to handle;
    }

    public fun conditional_multiple_same(b0: bool, b1: bool, b2: bool, handle: &mut EventHandle<DummyEvent>) {
        if (b0) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        };
        if (b1) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        };
        if (b2) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        }
    }
    spec fun conditional_multiple_same {
        emits DummyEvent{msg: 0} to handle if b0;
        emits DummyEvent{msg: 0} to handle if b1;
        emits DummyEvent{msg: 0} to handle if b2;
    }

    public fun conditional_multiple_same_incorrect(b: bool, handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
        Event::emit_event(handle, DummyEvent{msg: 0});
        if (b) {
            Event::emit_event(handle, DummyEvent{msg: 0});
        }
    }
    spec fun conditional_multiple_same_incorrect {
        emits DummyEvent{msg: 0} to handle;
        emits DummyEvent{msg: 0} to handle;
        emits DummyEvent{msg: 0} to handle;
    }


    // ----------------------------
    // `emits` statements in schema
    // ----------------------------

    public fun emits_in_schema(handle: &mut EventHandle<DummyEvent>) {
        Event::emit_event(handle, DummyEvent{msg: 0});
    }
    spec fun emits_in_schema {
        include EmitsInSchemaEmits;
    }
    spec schema EmitsInSchemaEmits {
        handle: EventHandle<DummyEvent>;
        emits DummyEvent{msg: 0} to handle;
    }
}

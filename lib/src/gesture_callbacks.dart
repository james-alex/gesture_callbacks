import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_object_map/flutter_object_map.dart';

/// A solution for handling locally and globally defined generic
/// gesture callbacks, and the combination thereof.
@immutable
class GestureCallbacks extends JoinableObject<GestureCallbacks> {
  /// An object for handling locally and globally defined generic
  /// gesture callbacks, and the combination thereof.
  ///
  /// If [inherit] is `false`, other [GestureCallbacks] will not be [merge]d
  /// or [combine]d into `this` [GestureCallbacks], however `this` may still
  /// be [merge]d or [combine]d into other [GestureCallbacks].
  const GestureCallbacks({
    this.key,
    this.onTapDown,
    this.onTapUp,
    this.onTap,
    this.onTapCancel,
    this.onSecondaryTap,
    this.onSecondaryTapDown,
    this.onSecondaryTapUp,
    this.onSecondaryTapCancel,
    this.onTertiaryTapDown,
    this.onTertiaryTapUp,
    this.onTertiaryTapCancel,
    this.onDoubleTapDown,
    this.onDoubleTap,
    this.onDoubleTapCancel,
    this.onLongPress,
    this.onLongPressStart,
    this.onLongPressMoveUpdate,
    this.onLongPressUp,
    this.onLongPressEnd,
    this.onSecondaryLongPress,
    this.onSecondaryLongPressStart,
    this.onSecondaryLongPressMoveUpdate,
    this.onSecondaryLongPressUp,
    this.onSecondaryLongPressEnd,
    this.onForcePressStart,
    this.onForcePressPeak,
    this.onForcePressUpdate,
    this.onForcePressEnd,
    this.onPanDown,
    this.onPanStart,
    this.onPanUpdate,
    this.onPanEnd,
    this.onPanCancel,
    this.onHover,
    bool inherit = true,
  }) : super(inherit: inherit);

  /// A unique identifier used to define the retrieve global [GestureCallbacks]
  /// with the [GestureCallbacks.global] constructor/provider and the related
  /// static methods.
  final Key? key;

  /// A pointer that might cause a tap with a primary button has
  /// contacted the screen at a particular location.
  ///
  /// See: [GestureDetector.onTapDown]
  final GestureTapDownCallback? onTapDown;

  /// A pointer that will trigger a tap with a primary button has
  /// stopped contacting the screen at a particular location.
  ///
  /// See: [GestureDetector.onTapUp]
  final GestureTapUpCallback? onTapUp;

  /// A tap with a primary button has occurred.
  ///
  /// See: [GestureDetector.onTap]
  final GestureTapCallback? onTap;

  /// The pointer that previously triggered [onTapDown] will not
  /// end up causing a tap.
  ///
  /// See: [GestureDetector.onTapCancel]
  final GestureTapCancelCallback? onTapCancel;

  /// A tap with a secondary button has occurred.
  ///
  /// See: [GestureDetector.onSecondaryTap]
  final GestureTapCallback? onSecondaryTap;

  /// A pointer that might cause a tap with a secondary button has
  /// contacted the screen at a particular location.
  ///
  /// See: [GestureDetector.onSecondaryTapDown]
  final GestureTapDownCallback? onSecondaryTapDown;

  /// A pointer that will trigger a tap with a secondary button has
  /// stopped contacting the screen at a particular location.
  ///
  /// See: [GestureDetector.onSecondaryTapUp]
  final GestureTapUpCallback? onSecondaryTapUp;

  /// The pointer that previously triggered [onSecondaryTapDown] will
  /// not end up causing a tap.
  ///
  /// See: [GestureDetector.onSecondaryTapCancel]
  final GestureTapCancelCallback? onSecondaryTapCancel;

  /// A pointer that might cause a tap with a tertiary button has
  /// contacted the screen at a particular location.
  ///
  /// See: [GestureDetector.onTertiaryTapDown]
  final GestureTapDownCallback? onTertiaryTapDown;

  /// A pointer that will trigger a tap with a tertiary button has
  /// stopped contacting the screen at a particular location.
  ///
  /// See: [GestureDetector.onTertiaryTapUp]
  final GestureTapUpCallback? onTertiaryTapUp;

  /// The pointer that previously triggered [onTertiaryTapDown] will
  /// not end up causing a tap.
  ///
  /// See: [GestureDetector.onTertiaryTapCancel]
  final GestureTapCancelCallback? onTertiaryTapCancel;

  /// A pointer that might cause a double tap has contacted the screen
  /// at a particular location.
  ///
  /// See: [GestureDetector.onDoubleTapDown]
  final GestureTapDownCallback? onDoubleTapDown;

  /// The user has tapped the screen with a primary button at the same
  /// location twice in quick succession.
  ///
  /// See: [GestureDetector.onDoubleTap]
  final GestureTapCallback? onDoubleTap;

  /// The pointer that previously triggered [onDoubleTapDown] will
  /// not end up causing a double tap.
  ///
  /// See: [GestureDetector.onDoubleTapCancel]
  final GestureTapCancelCallback? onDoubleTapCancel;

  /// Called when a long press gesture with a primary button has
  /// been recognized.
  ///
  /// See: [GestureDetector.onLongPress]
  final GestureLongPressCallback? onLongPress;

  /// Called when a long press gesture with a primary button has
  /// been recognized.
  ///
  /// See: [GestureDetector.onLongPressStart]
  final GestureLongPressStartCallback? onLongPressStart;

  /// A pointer has been drag-moved after a long press with a primary button.
  ///
  /// See: [GestureDetector.onLongPressMoveUpdate]
  final GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate;

  /// A pointer that has triggered a long-press with a primary button
  /// has stopped contacting the screen.
  ///
  /// See: [GestureDetector.onLongPressUp]
  final GestureLongPressUpCallback? onLongPressUp;

  /// A pointer that has triggered a long-press with a primary button
  /// has stopped contacting the screen.
  ///
  /// See: [GestureDetector.onLongPressEnd]
  final GestureLongPressEndCallback? onLongPressEnd;

  /// Called when a long press gesture with a secondary button
  /// has been recognized.
  ///
  /// See: [GestureDetector.onSecondaryLongPress]
  final GestureLongPressCallback? onSecondaryLongPress;

  /// Called when a long press gesture with a secondary button
  /// has been recognized.
  ///
  /// See: [GestureDetector.onSecondaryLongPressStart]
  final GestureLongPressStartCallback? onSecondaryLongPressStart;

  /// A pointer has been drag-moved after a long press with a secondary button.
  ///
  /// See: [GestureDetector.onSecondaryLongPressMoveUpdate]
  final GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate;

  /// A pointer that has triggered a long-press with a secondary button
  /// has stopped contacting the screen.
  ///
  /// See: [GestureDetector.onSecondaryLongPressUp]
  final GestureLongPressUpCallback? onSecondaryLongPressUp;

  /// A pointer that has triggered a long-press with a secondary button
  /// has stopped contacting the screen.
  ///
  /// See: [GestureDetector.onSecondaryLongPressEnd]
  final GestureLongPressEndCallback? onSecondaryLongPressEnd;

  /// A pointer has contacted the screen with a primary button and
  /// might begin to move.
  ///
  /// See: [GestureDetector.onPanDown]
  final GestureDragDownCallback? onPanDown;

  /// A pointer has contacted the screen with a primary button and
  /// has begun to move.
  ///
  /// See: [GestureDetector.onPanStart]
  final GestureDragStartCallback? onPanStart;

  /// A pointer that is in contact with the screen with a primary
  /// button and moving has moved again.
  ///
  /// See: [GestureDetector.onPanUpdate]
  final GestureDragUpdateCallback? onPanUpdate;

  /// A pointer that was previously in contact with the screen with a
  /// primary button and moving is no longer in contact with the screen.
  ///
  /// See: [GestureDetector.onPanEnd]
  final GestureDragEndCallback? onPanEnd;

  /// The pointer that previously triggered [onPanDown] did not complete.
  ///
  /// See: [GestureDetector.onPanCancel]
  final GestureDragCancelCallback? onPanCancel;

  /// The pointer is in contact with the screen and has pressed with
  /// sufficient force to initiate a force press.
  ///
  /// See: [GestureDetector.onForcePressStart]
  final GestureForcePressStartCallback? onForcePressStart;

  /// The pointer is in contact with the screen and has pressed with
  /// the maximum force.
  ///
  /// See: [GestureDetector.onForcePressPeak]
  final GestureForcePressPeakCallback? onForcePressPeak;

  /// A pointer is in contact with the screen, has previously passed the
  /// [ForcePressGestureRecognizer.startPressure] and is either moving on
  /// the plane of the screen, pressing the screen with varying forces or
  /// both simultaneously.
  ///
  /// See: [GestureDetector.onForcePressUpdate]
  final GestureForcePressUpdateCallback? onForcePressUpdate;

  /// The pointer is no longer in contact with the screen.
  ///
  /// See: [GestureDetector.onForcePressEnd]
  final GestureForcePressEndCallback? onForcePressEnd;

  /// Called when a pointer enters or exits a widget's area.
  final ValueSetter<bool>? onHover;

  /// Returns a new [GestureCallbacks] by combining `this` and [callbacks]
  /// respective values into new functions that call the values of both.
  @override
  GestureCallbacks combine(GestureCallbacks? callbacks) {
    if (!inherit || callbacks == null) {
      return this;
    }

    return GestureCallbacks(
      key: key,
      onTapDown: _combineEventCallbacks<TapDownDetails>(
          onTapDown, callbacks.onTapDown),
      onTapUp: _combineEventCallbacks<TapUpDetails>(onTapUp, callbacks.onTapUp),
      onTap: _combineCallbacks(onTap, callbacks.onTap),
      onTapCancel: _combineCallbacks(onTapCancel, callbacks.onTapCancel),
      onSecondaryTap:
          _combineCallbacks(onSecondaryTap, callbacks.onSecondaryTap),
      onSecondaryTapDown: _combineEventCallbacks<TapDownDetails>(
          onSecondaryTapDown, callbacks.onSecondaryTapDown),
      onSecondaryTapUp: _combineEventCallbacks<TapUpDetails>(
          onSecondaryTapUp, callbacks.onSecondaryTapUp),
      onSecondaryTapCancel: _combineCallbacks(
          onSecondaryTapCancel, callbacks.onSecondaryTapCancel),
      onTertiaryTapDown: _combineEventCallbacks<TapDownDetails>(
          onTertiaryTapDown, callbacks.onTertiaryTapDown),
      onTertiaryTapUp: _combineEventCallbacks<TapUpDetails>(
          onTertiaryTapUp, callbacks.onTertiaryTapUp),
      onTertiaryTapCancel:
          _combineCallbacks(onTertiaryTapCancel, callbacks.onTertiaryTapCancel),
      onDoubleTapDown: _combineEventCallbacks<TapDownDetails>(
          onDoubleTapDown, callbacks.onDoubleTapDown),
      onDoubleTap: _combineCallbacks(onDoubleTap, callbacks.onDoubleTap),
      onDoubleTapCancel:
          _combineCallbacks(onDoubleTapCancel, callbacks.onDoubleTapCancel),
      onLongPress: _combineCallbacks(onLongPress, callbacks.onLongPress),
      onLongPressStart: _combineEventCallbacks<LongPressStartDetails>(
          onLongPressStart, callbacks.onLongPressStart),
      onLongPressMoveUpdate: _combineEventCallbacks<LongPressMoveUpdateDetails>(
          onLongPressMoveUpdate, callbacks.onLongPressMoveUpdate),
      onLongPressUp: _combineCallbacks(onLongPressUp, callbacks.onLongPressUp),
      onLongPressEnd: _combineEventCallbacks<LongPressEndDetails>(
          onLongPressEnd, callbacks.onLongPressEnd),
      onSecondaryLongPress: _combineCallbacks(
          onSecondaryLongPress, callbacks.onSecondaryLongPress),
      onSecondaryLongPressStart: _combineEventCallbacks<LongPressStartDetails>(
          onSecondaryLongPressStart, callbacks.onSecondaryLongPressStart),
      onSecondaryLongPressMoveUpdate:
          _combineEventCallbacks<LongPressMoveUpdateDetails>(
              onSecondaryLongPressMoveUpdate,
              callbacks.onSecondaryLongPressMoveUpdate),
      onSecondaryLongPressUp: _combineCallbacks(
          onSecondaryLongPressUp, callbacks.onSecondaryLongPressUp),
      onSecondaryLongPressEnd: _combineEventCallbacks<LongPressEndDetails>(
          onSecondaryLongPressEnd, callbacks.onSecondaryLongPressEnd),
      onPanDown: _combineEventCallbacks<DragDownDetails>(
          onPanDown, callbacks.onPanDown),
      onPanStart: _combineEventCallbacks<DragStartDetails>(
          onPanStart, callbacks.onPanStart),
      onPanUpdate: _combineEventCallbacks<DragUpdateDetails>(
          onPanUpdate, callbacks.onPanUpdate),
      onPanEnd:
          _combineEventCallbacks<DragEndDetails>(onPanEnd, callbacks.onPanEnd),
      onPanCancel: _combineCallbacks(onPanCancel, callbacks.onPanCancel),
      onForcePressStart: _combineEventCallbacks<ForcePressDetails>(
          onForcePressStart, callbacks.onForcePressStart),
      onForcePressPeak: _combineEventCallbacks<ForcePressDetails>(
          onForcePressPeak, callbacks.onForcePressPeak),
      onForcePressUpdate: _combineEventCallbacks<ForcePressDetails>(
          onForcePressUpdate, callbacks.onForcePressUpdate),
      onForcePressEnd: _combineEventCallbacks<ForcePressDetails>(
          onForcePressEnd, callbacks.onForcePressEnd),
      onHover: _combineEventCallbacks<bool>(onHover, callbacks.onHover),
    );
  }

  /// Returns a new [GestureCallbacks] containing `this` object's values,
  /// where any `null` values fallback to [callbacks]` values.
  @override
  GestureCallbacks merge(GestureCallbacks? callbacks) {
    if (!inherit || callbacks == null) {
      return this;
    }

    return GestureCallbacks(
      key: key,
      onTapDown: onTapDown ?? callbacks.onTapDown,
      onTapUp: onTapUp ?? callbacks.onTapUp,
      onTap: onTap ?? callbacks.onTap,
      onTapCancel: onTapCancel ?? callbacks.onTapCancel,
      onSecondaryTap: onSecondaryTap ?? callbacks.onSecondaryTap,
      onSecondaryTapDown: onSecondaryTapDown ?? callbacks.onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp ?? callbacks.onSecondaryTapUp,
      onSecondaryTapCancel:
          onSecondaryTapCancel ?? callbacks.onSecondaryTapCancel,
      onTertiaryTapDown: onTertiaryTapDown ?? callbacks.onTertiaryTapDown,
      onTertiaryTapUp: onTertiaryTapUp ?? callbacks.onTertiaryTapUp,
      onTertiaryTapCancel: onTertiaryTapCancel ?? callbacks.onTertiaryTapCancel,
      onDoubleTapDown: onDoubleTapDown ?? callbacks.onDoubleTapDown,
      onDoubleTap: onDoubleTap ?? callbacks.onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel ?? callbacks.onDoubleTapCancel,
      onLongPress: onLongPress ?? callbacks.onLongPress,
      onLongPressStart: onLongPressStart ?? callbacks.onLongPressStart,
      onLongPressMoveUpdate:
          onLongPressMoveUpdate ?? callbacks.onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp ?? callbacks.onLongPressUp,
      onLongPressEnd: onLongPressEnd ?? callbacks.onLongPressEnd,
      onSecondaryLongPress:
          onSecondaryLongPress ?? callbacks.onSecondaryLongPress,
      onSecondaryLongPressStart:
          onSecondaryLongPressStart ?? callbacks.onSecondaryLongPressStart,
      onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate ??
          callbacks.onSecondaryLongPressMoveUpdate,
      onSecondaryLongPressUp:
          onSecondaryLongPressUp ?? callbacks.onSecondaryLongPressUp,
      onSecondaryLongPressEnd:
          onSecondaryLongPressEnd ?? callbacks.onSecondaryLongPressEnd,
      onForcePressStart: onForcePressStart ?? callbacks.onForcePressStart,
      onForcePressPeak: onForcePressPeak ?? callbacks.onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate ?? callbacks.onForcePressUpdate,
      onForcePressEnd: onForcePressEnd ?? callbacks.onForcePressEnd,
      onPanDown: onPanDown ?? callbacks.onPanDown,
      onPanStart: onPanStart ?? callbacks.onPanStart,
      onPanUpdate: onPanUpdate ?? callbacks.onPanUpdate,
      onPanEnd: onPanEnd ?? callbacks.onPanEnd,
      onPanCancel: onPanCancel ?? callbacks.onPanCancel,
      onHover: onHover ?? callbacks.onHover,
    );
  }

  /// The map containing the registered global callbacks.
  static final JoinableObjectMap<GestureCallbacks> _global =
      JoinableObjectMap<GestureCallbacks>();

  /// Registers `this` as a global [GestureCallbacks], allowing it be
  /// accessed by the [global] callbacks constructor/provider and
  /// related methods.
  void registerAsGlobal<T>([JoinMethod join = JoinMethod.combine]) {
    _global.add<T>(this, key: key, join: join);
  }

  /// Creates or retrieves a global [GestureCallbacks].
  ///
  /// If a global [GestureCallbacks] associated with the given [key] and
  /// sub-type ([T]) doesn't exist, a new global [GestureCallbacks] will be
  /// created. However, if they do exist, the existing callbacks will be
  /// returned, if no additional values were provided.
  ///
  /// If corresponding global callbacks do exist and additional values were
  /// provided and [join] isn't `null`, the provided values will be [merge]d
  /// or [combine]d with the existing global callbacks. However, if [join]
  /// is `null`, the existing global callbacks will be replaced outright by
  /// a new [GestureCallbacks] containing only the provided values.
  ///
  /// If [joinDynamic] isn't `null` and global callbacks associated with the
  /// given [key] and a [dynamic] sub-type exist, they will be [merge]d or
  /// [combine]d with the returned callbacks.
  static GestureCallbacks? global<T>({
    Key? key,
    GestureTapDownCallback? onTapDown,
    GestureTapUpCallback? onTapUp,
    GestureTapCallback? onTap,
    GestureTapCancelCallback? onTapCancel,
    GestureTapCallback? onSecondaryTap,
    GestureTapDownCallback? onSecondaryTapDown,
    GestureTapUpCallback? onSecondaryTapUp,
    GestureTapCancelCallback? onSecondaryTapCancel,
    GestureTapDownCallback? onTertiaryTapDown,
    GestureTapUpCallback? onTertiaryTapUp,
    GestureTapCancelCallback? onTertiaryTapCancel,
    GestureTapDownCallback? onDoubleTapDown,
    GestureTapCallback? onDoubleTap,
    GestureTapCancelCallback? onDoubleTapCancel,
    GestureLongPressCallback? onLongPress,
    GestureLongPressStartCallback? onLongPressStart,
    GestureLongPressMoveUpdateCallback? onLongPressMoveUpdate,
    GestureLongPressUpCallback? onLongPressUp,
    GestureLongPressEndCallback? onLongPressEnd,
    GestureLongPressCallback? onSecondaryLongPress,
    GestureLongPressStartCallback? onSecondaryLongPressStart,
    GestureLongPressMoveUpdateCallback? onSecondaryLongPressMoveUpdate,
    GestureLongPressUpCallback? onSecondaryLongPressUp,
    GestureLongPressEndCallback? onSecondaryLongPressEnd,
    GestureDragDownCallback? onPanDown,
    GestureDragStartCallback? onPanStart,
    GestureDragUpdateCallback? onPanUpdate,
    GestureDragEndCallback? onPanEnd,
    GestureDragCancelCallback? onPanCancel,
    GestureForcePressStartCallback? onForcePressStart,
    GestureForcePressPeakCallback? onForcePressPeak,
    GestureForcePressUpdateCallback? onForcePressUpdate,
    GestureForcePressEndCallback? onForcePressEnd,
    ValueSetter<bool>? onHover,
    JoinMethod join = JoinMethod.combine,
    JoinMethod? joinDynamic = JoinMethod.combine,
  }) {
    late GestureCallbacks? callbacks;
    callbacks = GestureCallbacks(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTap: onTap,
      onTapCancel: onTapCancel,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapDown: onSecondaryTapDown,
      onSecondaryTapUp: onSecondaryTapUp,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onTertiaryTapDown: onTertiaryTapDown,
      onTertiaryTapUp: onTertiaryTapUp,
      onTertiaryTapCancel: onTertiaryTapCancel,
      onDoubleTapDown: onDoubleTapDown,
      onDoubleTap: onDoubleTap,
      onDoubleTapCancel: onDoubleTapCancel,
      onLongPress: onLongPress,
      onLongPressStart: onLongPressStart,
      onLongPressMoveUpdate: onLongPressMoveUpdate,
      onLongPressUp: onLongPressUp,
      onLongPressEnd: onLongPressEnd,
      onSecondaryLongPress: onSecondaryLongPress,
      onSecondaryLongPressStart: onSecondaryLongPressStart,
      onSecondaryLongPressMoveUpdate: onSecondaryLongPressMoveUpdate,
      onSecondaryLongPressUp: onSecondaryLongPressUp,
      onSecondaryLongPressEnd: onSecondaryLongPressEnd,
      onPanDown: onPanDown,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      onPanCancel: onPanCancel,
      onForcePressStart: onForcePressStart,
      onForcePressPeak: onForcePressPeak,
      onForcePressUpdate: onForcePressUpdate,
      onForcePressEnd: onForcePressEnd,
      onHover: onHover,
    );

    if (callbacks._isEmpty) {
      // Retrieve the existing global callbacks if no values were provided.
      callbacks = _global.get<T>(key: key);
    } else {
      // Otherwise, add the new global callbacks to the global object map,
      // replacing or merging/combining it with the existing global callbacks,
      // if they exist.
      callbacks = _global.add<T>(callbacks, key: key, join: join);
    }

    // If [joinDynamic] isn't `null`, merge/combine the returned callbacks
    // with the [dynamic] global callbacks, if they exist.
    if (T != dynamic &&
        joinDynamic != null &&
        _global.exists<dynamic>(key: key)) {
      final dynamicCallbacks = _global.get<dynamic>(key: key);
      if (callbacks == null) return dynamicCallbacks;
      callbacks = joinDynamic == JoinMethod.combine
          ? callbacks.combine(_global.get<dynamic>(key: key))
          : callbacks.merge(_global.get<dynamic>(key: key));
    }

    return callbacks;
  }

  /// Returns `true` if global callbacks associated with the [key] and
  /// sub-type ([T]) exist.
  static bool globalCallbacksExist<T>([Key? key]) =>
      _global.exists<T>(key: key);

  /// Returns the global callbacks with the corresponding [key]
  /// and sub-type ([T]).
  ///
  /// Returns `null` if no corresponding global callbacks exist.
  ///
  /// __Note:__ [dynamic] sub-typed callbacks will not be joined with the
  /// returned callbacks, call [GestureCallbacks.global] to retrieve
  /// callbacks that are joined with the [dynamic] sub-typed callbacks,
  /// if they exist.
  static GestureCallbacks? getGlobalCallbacks<T>([Key? key]) =>
      _global.get<T>(key: key);

  /// Removes the global callbacks with the corresponding [key]
  /// and sub-type ([T]).
  ///
  /// Returns `null` if no corresponding global callbacks exist.
  static GestureCallbacks? removeGlobalCallbacks<T>([Key? key]) =>
      _global.remove<T>(key: key);

  /// Returns a new [GestureCallbacks] by joining [callbacks] with the
  /// global callbacks associated with the given [key] and sub-type ([T]).
  ///
  /// If there is no corresponding global callbacks, [callbacks] will be
  /// returned. Likewise, if [callbacks] is `null`, the global callbacks
  /// will be returned.
  ///
  /// If [joinDynamic] isn't `null` and the sub-type ([T]) isn't [dynamic], the
  /// global callbacks associated with the [key] and a [dynamic] sub-type will
  /// be [merge]d or [combine]d into the returned callbacks, if they exist.
  ///
  /// Returns `null` if [callbacks] is `null` and no corresponding global
  /// callbacks exist.
  static GestureCallbacks? joinWithGlobal<T>(
    GestureCallbacks? callbacks, {
    Key? key,
    JoinMethod joinDynamic = JoinMethod.combine,
  }) {
    final globalCallbacks =
        GestureCallbacks.global<T>(key: key, joinDynamic: joinDynamic);

    if (callbacks == null) {
      return globalCallbacks;
    }

    if (globalCallbacks == null) {
      return callbacks;
    }

    return callbacks.merge(globalCallbacks);
  }

  /// Returns a new callback by creating a new function that calls
  /// both [a] and [b].
  ///
  /// If either [a] or [b] is `null`, the other will be returned.
  ///
  /// If [merge] is `true`, [b] will be treated as a fallback and
  /// [a] will be returned, falling back to [b] if [a] is `null`.
  static _Callback? _combineCallbacks(
    _Callback? a,
    _Callback? b, [
    bool merge = false,
  ]) =>
      a != null && b != null && !merge
          ? () {
              a();
              b();
            }
          : a ?? b;

  /// Returns a new event callback by creating a new function that
  /// calls both [a] and [b].
  ///
  /// If either [a] or [b] is `null`, the other will be returned.
  ///
  /// If [merge] is `true`, [b] will be treated as a fallback and
  /// [a] will be returned, falling back to [b] if [a] is `null`.
  static _EventCallback<T>? _combineEventCallbacks<T>(
    _EventCallback<T>? a,
    _EventCallback<T>? b, [
    bool merge = false,
  ]) =>
      a != null && b != null && !merge
          ? (T event) {
              a(event);
              b(event);
            }
          : a ?? b;

  /// Returns `true` if there are no callbacks associated with this object.
  bool get _isEmpty =>
      onTapDown != null ||
      onTapUp != null ||
      onTap != null ||
      onTapCancel != null ||
      onSecondaryTap != null ||
      onSecondaryTapDown != null ||
      onSecondaryTapUp != null ||
      onTertiaryTapDown != null ||
      onTertiaryTapUp != null ||
      onTertiaryTapCancel != null ||
      onDoubleTapDown != null ||
      onDoubleTap != null ||
      onDoubleTapCancel != null ||
      onLongPress != null ||
      onLongPressStart != null ||
      onLongPressMoveUpdate != null ||
      onLongPressUp != null ||
      onLongPressEnd != null ||
      onSecondaryTap != null ||
      onSecondaryLongPress != null ||
      onSecondaryLongPressStart != null ||
      onSecondaryLongPressMoveUpdate != null ||
      onSecondaryLongPressUp != null ||
      onSecondaryLongPressEnd != null ||
      onForcePressStart != null ||
      onForcePressPeak != null ||
      onForcePressUpdate != null ||
      onForcePressEnd != null ||
      onPanDown != null ||
      onPanStart != null ||
      onPanUpdate != null ||
      onPanEnd != null ||
      onPanCancel != null;
}

typedef _Callback = void Function();

typedef _EventCallback<T> = void Function(T event);

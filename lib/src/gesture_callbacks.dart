import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_object_map/flutter_object_map.dart';

/// A solution for handling locally and globally applied generic
/// gesture callbacks, and the combination thereof.
@immutable
class GestureCallbacks extends JoinableObject<GestureCallbacks> {
  /// An object for handling locally and globally applied generic
  /// gesture callbacks, and the combination thereof.
  ///
  /// If [inherit] is `false`, other [GestureCallbacks] will not be [merge]d
  /// or [combine]d into `this` [GestureCallbacks], however `this` may still
  /// be [merge]d or [combine]d into other [GestureCallbacks].
  const GestureCallbacks({
    this.key,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    this.onSecondaryLongPress,
    this.onHover,
    bool inherit = true,
  }) : super(inherit: inherit);

  /// A unique identifier used to define the retrieve global [GestureCallbacks]
  /// with the [GestureCallbacks.global] constructor/provider and the related
  /// static methods.
  final Key? key;

  /// Called when a tap with a primary button has occurred.
  final GestureTapCallback? onTap;

  /// Called when the user has tapped the screen with a primary
  /// button at the same location twice in quick succession.
  final GestureTapCallback? onDoubleTap;

  /// Called when a long press gesture with a primary button has
  /// been recognized.
  final GestureTapCallback? onLongPress;

  /// Called when a tap with a secondary button has occurred.
  final GestureTapCallback? onSecondaryTap;

  /// Called when a long press gesture with a secondary button has
  /// been recognized.
  final GestureTapCallback? onSecondaryLongPress;

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
      onTap: _combineCallbacks(onTap, callbacks.onTap),
      onDoubleTap: _combineCallbacks(onDoubleTap, callbacks.onDoubleTap),
      onLongPress: _combineCallbacks(onLongPress, callbacks.onLongPress),
      onSecondaryTap:
          _combineCallbacks(onSecondaryTap, callbacks.onSecondaryTap),
      onSecondaryLongPress: _combineCallbacks(
          onSecondaryLongPress, callbacks.onSecondaryLongPress),
      onHover: _combineValueSetter(onHover, callbacks.onHover),
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
      onTap: onTap ?? callbacks.onTap,
      onDoubleTap: onDoubleTap ?? callbacks.onDoubleTap,
      onLongPress: onLongPress ?? callbacks.onLongPress,
      onSecondaryTap: onSecondaryTap ?? callbacks.onSecondaryTap,
      onSecondaryLongPress:
          onSecondaryLongPress ?? callbacks.onSecondaryLongPress,
      onHover: onHover ?? callbacks.onHover,
    );
  }

  /// The map containing the registered global callbacks.
  static final JoinableObjectMap<GestureCallbacks> _global =
      JoinableObjectMap<GestureCallbacks>();

  /// Registers `this` as a global [GestureCallbacks], allowing it be
  /// accessed by the [global] callbacks constructor/provider and
  /// related methods.
  void registerAsGlobal<T>([JoinMethod? join = JoinMethod.combine]) {
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
  ///
  /// Returns `null` if no values were provided and no corresponding global
  /// callbacks exist.
  static GestureCallbacks? global<T>({
    Key? key,
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureTapCallback? onLongPress,
    GestureTapCallback? onSecondaryTap,
    GestureTapCallback? onSecondaryLongPress,
    ValueSetter<bool>? onHover,
    JoinMethod? join = JoinMethod.combine,
    JoinMethod? joinDynamic = JoinMethod.combine,
  }) {
    GestureCallbacks? callbacks;
    callbacks = GestureCallbacks(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onSecondaryTap: onSecondaryTap,
      onSecondaryLongPress: onSecondaryLongPress,
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
      callbacks = joinDynamic == JoinMethod.combine
          ? callbacks!.combine(_global.get<dynamic>(key: key))
          : callbacks!.merge(_global.get<dynamic>(key: key));
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
    JoinMethod? joinDynamic = JoinMethod.combine,
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

  /// Returns a new [GestureTapCallback] by creating a new function
  /// that calls both [a] and [b].
  ///
  /// If either [a] or [b] is `null`, the other will be returned.
  ///
  /// If [merge] is `true`, [b] will be treated as a fallback and
  /// [a] will be returned, falling back to [b] if [a] is `null`.
  static GestureTapCallback? _combineCallbacks(
    GestureTapCallback? a,
    GestureTapCallback? b, [
    bool merge = false,
  ]) =>
      a != null && b != null && !merge
          ? () {
              a();
              b();
            }
          : a ?? b;

  /// Returns a new [ValueSetter] by creating a new function that
  /// calls both [a] and [b].
  ///
  /// If either [a] or [b] is `null`, the other will be returned.
  ///
  /// If [merge] is `true`, [b] will be treated as a fallback and
  /// [a] will be returned, falling back to [b] if [a] is `null`.
  static ValueSetter<bool>? _combineValueSetter(
    ValueSetter<bool>? a,
    ValueSetter<bool>? b, [
    bool merge = false,
  ]) =>
      a != null && b != null && !merge
          ? (value) {
              a(value);
              b(value);
            }
          : a ?? b;

  /// Returns `true` if no callbacks were provided to `this`.
  bool get _isEmpty =>
      onTap == null &&
      onDoubleTap == null &&
      onLongPress == null &&
      onSecondaryTap == null &&
      onSecondaryLongPress == null &&
      onHover == null;
}

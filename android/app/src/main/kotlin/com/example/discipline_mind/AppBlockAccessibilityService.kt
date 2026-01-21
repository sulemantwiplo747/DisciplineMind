package com.example.discipline_mind
import android.accessibilityservice.AccessibilityService
import android.content.Intent
import android.view.accessibility.AccessibilityEvent

class AppBlockAccessibilityService : AccessibilityService() {

    companion object {
        var enabled = false
        var blockedApps: Set<String> = emptySet()
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        if (!enabled) return
        if (event?.eventType != AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) return

        val pkg = event.packageName?.toString() ?: return
        if (blockedApps.contains(pkg)) {
            val intent = Intent(this, BlockedScreenActivity::class.java)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            startActivity(intent)
        }
    }

    override fun onInterrupt() {}
}

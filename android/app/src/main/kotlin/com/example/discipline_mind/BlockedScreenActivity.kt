package com.example.discipline_mind

import android.app.Activity
import android.os.Bundle
import android.view.WindowManager
import android.widget.TextView

class BlockedScreenActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        window.setType(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY)
        window.addFlags(
            WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or
            WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
            WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
        )

        val tv = TextView(this)
        tv.text = "THIS APP IS BLOCKED"
        tv.textSize = 26f
        tv.setPadding(50, 200, 50, 50)

        setContentView(tv)
    }
}

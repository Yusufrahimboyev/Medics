package dev.medics.medics

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("en_US")
        MapKitFactory.setApiKey("fa360d66-c13c-4baa-9879-96bab78976e7")
    }
}
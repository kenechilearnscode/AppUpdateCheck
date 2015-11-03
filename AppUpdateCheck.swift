//
//  AppUpdateCheck.swift
//
//
//  Created by Kc on 03/11/2015.
//
//

import Foundation

class AppUpdateCheck {
    
    let defaults = NSUserDefaults.standardUserDefaults() // gets instance of NSUserDefaults for persistent store
    let currentAppVersion = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String // gets current app version on user's device
    
    func saveCurrentVersionToDefaults() {
        // saves currentAppVersion to defaults
        defaults.setObject(currentAppVersion, forKey: "appVersion")
        defaults.synchronize()
    }
    
    func hasAppBeenUpdated() -> Bool {
        
        var appUpdated = false // indicates whether app has been updated or not
        
        let previousAppVersion = defaults.stringForKey("appVersion") // checks stored app version in NSUserDefaults
        
        if previousAppVersion == nil {
            // first run, no appVersion has ever been saved to NSUserDefaults
            
            saveCurrentVersionToDefaults()
            
        } else if previousAppVersion != currentAppVersion {
            // app versions are different, thus the app has been updated
            
            saveCurrentVersionToDefaults()
            appUpdated = true
            
        }
        
        print("The current app version is: \(currentAppVersion). \n The app has been updated: \(appUpdated)")
        return appUpdated
    }
    
}

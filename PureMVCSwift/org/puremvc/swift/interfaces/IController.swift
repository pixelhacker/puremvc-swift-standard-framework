//
//  IController.swift
//  PureMVC Swift
//
//  Created by Stephan Schulz on 01.07.14.
//  Copyright (c) 2014 Stephan Schulz. All rights reserved.
//

import Foundation

/** 
 * The interface definition for a PureMVC Controller.
 *
 * <P>
 * In PureMVC, an <code>IController</code> implementor
 * follows the 'Command and Controller' strategy, and
 * assumes these responsibilities:
 * <UL>
 * <LI> Remembering which <code>ICommand</code>s
 * are intended to handle which <code>INotifications</code>.</LI>
 * <LI> Registering itself as an <code>IObserver</code> with
 * the <code>View</code> for each <code>INotification</code>
 * that it has an <code>ICommand</code> mapping for.</LI>
 * <LI> Creating a new instance of the proper <code>ICommand</code>
 * to handle a given <code>INotification</code> when notified by the <code>View</code>.</LI>
 * <LI> Calling the <code>ICommand</code>'s <code>execute</code>
 * method, passing in the <code>INotification</code>.</LI>
 * </UL>
 *
 * @see INotification, ICommand
 */

protocol IController {

    /** 
     * Execute the <code>ICommand</code> previously registered as the
     * handler for <code>INotification</code>s with the given notification name.
     *
     * @param notification the <code>INotification</code> to execute the associated <code>ICommand</code> for
     */
    func executeCommand(notification: INotification)

    /** 
     * Check if a Command is registered for a given Notification
     *
     * @param notificationName
     * @return whether a Command is currently registered for the given <code>notificationName</code>.
     */
    func hasCommand(notificationName: String) -> Bool

    /** 
     * Register a particular <code>ICommand</code> class as the handler
     * for a particular <code>INotification</code>.
     *
     * @param notificationName the name of the <code>INotification</code>
     * @param commandClassRef the Class of the <code>ICommand</code>
     */
    func registerCommand(notificationName: String, commandClass: Notifier.Type)

    /** 
     * Remove a previously registered <code>ICommand</code> to <code>INotification</code> mapping.
     *
     * @param notificationName the name of the <code>INotification</code> to remove the <code>ICommand</code> mapping for
     */
    func removeCommand(notificationName: String)
}

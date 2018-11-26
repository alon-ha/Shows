//
//  Router.swift
//  Shows
//
//  Created by Alon Haiut on 26/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol Routering {
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    func present(_ module: Presentable, animated: Bool)
    func push(_ module: Presentable, animated: Bool, completion: PublishSubject<Void>?)
    func pop(animated: Bool)
    func dismiss(animated: Bool, completion: PublishSubject<Void>?)
    func setRoot(_ module: Presentable)
    func popToRoot(animated: Bool)
}

class Router: NSObject, Routering {

    fileprivate var completions: [UIViewController: PublishSubject<Void>]
    unowned let navigationController: UINavigationController
    var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.completions = [:]
        super.init()
        self.navigationController.delegate = self
    }

    func present(_ module: Presentable, animated: Bool) {
        navigationController.present(module.toPresentable(),
                                     animated: animated,
                                     completion: nil)
    }

    func push(_ module: Presentable,
              animated: Bool,
              completion: PublishSubject<Void>?) {
        guard module.toPresentable() is UINavigationController == false else {
                return
        }

        if let completion = completion {
            completions[module.toPresentable()] = completion
        }

        navigationController.pushViewController(module.toPresentable(), animated: animated)
    }

    func pop(animated: Bool) {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func dismiss(animated: Bool, completion: PublishSubject<Void>?) {
        navigationController.dismiss(animated: animated) {
            completion?.onNext()
        }
    }

    func setRoot(_ module: Presentable) {
        navigationController.setViewControllers([module.toPresentable()], animated: false)
    }

    func popToRoot(animated: Bool) {
        if let controllers = navigationController.popToRootViewController(animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }
}

extension Router: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Ensure the view controller is popping
        guard let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(poppedViewController) else {
            return
        }
        runCompletion(for: poppedViewController)
    }
}

fileprivate extension Router {
    func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else {
            return
        }
        completion.onNext()
        completions.removeValue(forKey: controller)
    }
}

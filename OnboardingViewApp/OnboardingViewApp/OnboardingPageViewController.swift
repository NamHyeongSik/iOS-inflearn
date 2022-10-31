//
//  OnboardingPageViewController.swift
//  OnboardingViewApp
//
//  Created by HYEONG SIK NAM on 2022/03/30.
//

import UIKit

class OnboardingPageViewController: UIPageViewController {

    var pages = [UIViewController]()
    var bottonButtonMargin: NSLayoutConstraint?
    var pageControl = UIPageControl()
    let startIndex = 0
    var currentIndex = 0 {
        didSet {
            pageControl.currentPage = currentIndex
        }
    }
    
    func makePageVC() {
        let itemVC1 = OnboardingItemViewController(nibName: "OnboardingItemViewController", bundle: nil)
        itemVC1.topImage = UIImage(named: "onboarding1")
        itemVC1.mainText = "Focus On your ideal buyer"
        itemVC1.subText = "abcdefg"
        
        let itemVC2 = OnboardingItemViewController(nibName: "OnboardingItemViewController", bundle: nil)
        itemVC2.topImage = UIImage(named: "onboarding2")
        itemVC2.mainText = "Entice with benefits"
        itemVC2.subText = "abcdefg"
        
        let itemVC3 = OnboardingItemViewController(nibName: "OnboardingItemViewController", bundle: nil)
        itemVC3.topImage = UIImage(named: "onboarding3")
        itemVC3.mainText = "Avoid yeah, yeah phrases"
        itemVC3.subText = "abcdefg"
        
        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        
        setViewControllers([itemVC1], direction: .forward, animated: true)
        self.dataSource = self
        self.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.makePageVC()
        self.makeBottomButton()
        self.makePageControl()
    }

    func makeBottomButton() {
        
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)
        
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false //autolayout하려면 기본적으로 false로 해놓아야함
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        bottonButtonMargin = button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottonButtonMargin?.isActive = true
        hideButton()
    }
    
    func makePageControl() {
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = startIndex
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
    }
    
    @objc func pageControlTapped(sender: UIPageControl) {
        if sender.currentPage > self.currentIndex {
            self.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true)
        } else {
            self.setViewControllers([pages[sender.currentPage]], direction: .reverse, animated: true)
        }
        self.currentIndex = sender.currentPage
        buttonPresent()
    }
    
    @objc func dismissPageVC() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension OnboardingPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        self.currentIndex = currentIndex
        if currentIndex == startIndex {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        self.currentIndex = currentIndex
        if currentIndex == pages.count - 1 {
            return pages.first
        } else {
            return pages[currentIndex + 1]
        }
    }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first else {
            return
        }
        
        guard let currentIndex = pages.firstIndex(of: currentVC) else {
            return
        }
        
        self.currentIndex = currentIndex
        buttonPresent()
    }
    
    func buttonPresent() {
        if currentIndex == pages.count - 1 {
            self.showButton()
        } else {
            self.hideButton()
        }
//        UIView.animate(withDuration: 0.3) {
//            self.view.layoutIfNeeded()
//        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)

    }
    
    func showButton() {
        bottonButtonMargin?.constant = 0
    }
    
    func hideButton() {
        bottonButtonMargin?.constant = 200
    }
}

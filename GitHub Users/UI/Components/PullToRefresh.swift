//
//  PullToRefresh.swift
//  GitHub Users
//
//  Created by Bogdan Belogurov on 29.08.2021.
//

import SwiftUI

struct PullToRefresh: UIViewRepresentable {

    private let view = UIView(frame: .zero)
    private let refreshControl = UIRefreshControl()
    private var refreshControlIsSetted = false

    private let onRefresh: () -> Void

    init(_ onRefresh: @escaping () -> Void) {
        self.onRefresh = onRefresh
    }

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ view: UIView, context: Context) {
        guard let scrollView = sequence(first: view, next: { $0.superview })
                .first(where: { $0 is UIScrollView })
                .flatMap({ $0 as? UIScrollView }) else { return }

        refreshControl.addTarget(context.coordinator,
                                 action: #selector(Coordinator.onRefreshAction(_:)),
                                 for: .valueChanged)

        scrollView.refreshControl = refreshControl
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(onRefresh)
    }

    class Coordinator {

        private let onRefresh: () -> Void

        init(_ onRefresh: @escaping () -> Void) {
            self.onRefresh = onRefresh
        }

        @objc func onRefreshAction(_ refreshControll: UIRefreshControl) {
            onRefresh()
            refreshControll.endRefreshing()
        }
    }
}

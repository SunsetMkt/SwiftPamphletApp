//
//  IssuesListFromCustom.swift
//  PresentSwiftUI
//
//  Created by Ming Dai on 2021/11/15.
//

import SwiftUI

struct IssuesListFromCustomView: View {
    @State var vm: IssueVM
    var body: some View {
        List {
            ForEach(vm.customIssues) { ci in
                Section {
                    ForEach(ci.issues) { i in
                        NavigationLink {
                            GuideView(number: i.number, title: i.title)
                        } label: {
                            Text(i.title)
                                .bold()
                        }
                    }
                } header: {
                    Text(ci.name).font(.title)
                }

            }
        }
        .onAppear {
            vm.doing(.customIssues)
        }
    }
}

struct CustomIssuesModel: Identifiable, Decodable, Hashable {
    var id: Int64
    var name: String
    var issues: [CustomIssue]
}

struct CustomIssue: Identifiable, Decodable, Hashable {
    var id: Int64
    var title: String
    var number: Int
}
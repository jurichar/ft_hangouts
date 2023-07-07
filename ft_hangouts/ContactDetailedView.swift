//
//  ContactDetailedView.swift
//  ft_hangouts
//
//  Created by Julien Richard on 07/07/2023.
//

import SwiftUI

struct ContactDetailedView: View {
    var body: some View {
        VStack {
            List {
                Section("general"){
                    LabeledContent("Name") {
                        Text("Jean")
                    }
                    LabeledContent("Surname") {
                        Text("Dupont")
                    }
                    LabeledContent("Number") {
                        Text("06 12 34 56 78")
                    }
                }
                Section ("note"){
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eget lectus maximus, semper purus ac, viverra purus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc consectetur magna ac neque commodo bibendum. In sed diam eu purus sodales dictum ut vel quam. Aliquam vel sagittis mi. Duis ultricies lectus enim, quis imperdiet dolor malesuada blandit. Maecenas ipsum quam, commodo at bibendum at, auctor sollicitudin arcu. Integer sagittis nibh eu dui consectetur pharetra. Fusce at euismod quam. Cras sit amet efficitur enim. Vivamus sit amet massa fringilla, placerat nisl in, mattis arcu. Nunc auctor eu purus ac sollicitudin. Mauris eu ultricies risus. Aliquam sed nunc diam. Vivamus eu orci luctus, cursus ante molestie, tristique nisi.")
                }
            }
            .navigationTitle("Name here")
        }
    }
}

struct ContactDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactDetailedView()
        }
    }
}

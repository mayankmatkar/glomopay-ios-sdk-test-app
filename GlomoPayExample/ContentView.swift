import SwiftUI
import GlomoPaySDK

struct ContentView: View {
    @StateObject private var model = CheckoutTesterViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter public key", text: $model.publicKey)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    TextField("Enter order ID or subscription ID", text: $model.identifier)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                } header: {
                    Text("Checkout credentials")
                }

                Section("Checkout") {
                    Text("Checkout type will be detected automatically from the order.")
                        .foregroundStyle(.secondary)
                    Toggle("Developer mode", isOn: $model.devMode)
                }

                Section {
                    Button("Start Checkout") {
                        model.startCheckout()
                    }
                    .frame(maxWidth: .infinity)
                    .disabled(model.isStarting)
                }

                Section("Last payment result") {
                    Text(model.status)
                        .foregroundStyle(.secondary)
                }

                Section("Events") {
                    if model.events.isEmpty {
                        Text("No events yet")
                            .foregroundStyle(.secondary)
                    } else {
                        ForEach(Array(model.events.enumerated()), id: \.offset) { _, event in
                            Text(event)
                                .font(.caption)
                                .textSelection(.enabled)
                        }
                    }
                }
            }
            .navigationTitle("GlomoPay SDK Tester")
            .background(ViewControllerResolver { controller in
                model.setPresenter(controller)
            })
        }
    }
}

#Preview {
    ContentView()
}

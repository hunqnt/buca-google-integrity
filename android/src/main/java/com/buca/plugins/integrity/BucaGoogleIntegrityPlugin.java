package com.buca.plugins.integrity;

import android.util.Log;
import androidx.annotation.NonNull;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailabilityLight;
import com.google.android.gms.tasks.Task;
import com.google.android.play.core.integrity.IntegrityManager;
import com.google.android.play.core.integrity.IntegrityManagerFactory;
import com.google.android.play.core.integrity.IntegrityTokenRequest;
import com.google.android.play.core.integrity.IntegrityTokenResponse;
import com.google.android.play.core.integrity.model.IntegrityErrorCode;

@CapacitorPlugin(name = "BucaGoogleIntegrity")
public class BucaGoogleIntegrityPlugin extends Plugin {
    @PluginMethod
    public void checkIntegrity(com.getcapacitor.PluginCall call) {
        String nonce = call.getString("nonce");
        if (nonce == null) {
            call.reject("Nonce is required");
            return;
        }

        IntegrityManager integrityManager = IntegrityManagerFactory.create(getContext());
        IntegrityTokenRequest request = IntegrityTokenRequest.builder()
                .setNonce(nonce)
                .build();

        Task<IntegrityTokenResponse> integrityTokenResponseTask = integrityManager.requestIntegrityToken(request);
        integrityTokenResponseTask.addOnSuccessListener(response -> {
            String integrityToken = response.token();
            JSObject result = new JSObject();
            result.put("token", integrityToken);
            call.resolve(result);
        }).addOnFailureListener(e -> {
            call.reject("Failed to get integrity token: " + e.getMessage());
        });
    }
}
